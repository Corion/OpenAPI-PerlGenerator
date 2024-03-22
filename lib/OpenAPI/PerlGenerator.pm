package OpenAPI::PerlGenerator 0.01;
use 5.032;
use experimental 'signatures';
use OpenAPI::PerlGenerator::Utils; # for tidy(), but we don't import that
use OpenAPI::PerlGenerator::Template;
use Carp 'croak';

use Moo 2;
use Mojo::Template;
no warnings 'experimental::signatures';
use JSON::Pointer;

has 'schema' => (
    is => 'ro',
);

our %default_templates;

has 'templates' => (
    is => 'lazy',
    default => sub { { %default_templates } },
);

has 'prefix' => (
    is => 'ro',
);

has 'tidy' => (
    is => 'rw',
    default => 1,
);

our %default_typemap = (
    string => 'Str',
    number => 'Num',
    integer => 'Int',
    boolean => '', # a conflict between JSON::PP::Boolean and Type::Tiny
    object  => 'Object',
);

has 'typemap' => (
    is => 'lazy',
    default => sub { +{ %default_typemap } },
);

sub fixup_json_ref( $root, $curr=$root ) {
    if( ref $curr eq 'ARRAY' ) {
        for my $c ($curr->@*) {
            $c = fixup_json_ref( $root, $c );
        }

    } elsif( ref $curr eq 'HASH' ) {
        for my $k (sort keys $curr->%*) {
            if( $k eq '$ref' ) {
                my $ref = $curr->{$k};
                $ref =~ s!^#!!;

                # But we want to know its class, maybe?!

                $curr = JSON::Pointer->get($root, $ref, 1);

            } else {
                $curr->{$k} = fixup_json_ref( $root, $curr->{ $k });
            }
        };
    } else {
        # nothing to do
    }

    return $curr
}

sub full_package( $self, $name, $prefix=$self->prefix ) {
    return "$prefix\::$name";
}

sub filename( $self, $name, $prefix=$self->prefix ) {
    return ((("lib::" . $self->full_package($name, $prefix)) =~ s!::!/!gr). '.pm');
}

sub map_type( $self, $elt ) {

    if( exists $elt->{anyOf}) {
        # ... so we have a multi-type. Hope that it is just a type or null
        return $self->map_type( $elt->{anyOf}->[0] );

    } elsif( my $type = $elt->{type}) {
        if( $type eq 'array' ) {
            die "Array type has no subtype?!"
                unless $elt->{items};
            my $subtype = $self->map_type( $elt->{items} );
            return "ArrayRef[$subtype]"
        } elsif( exists $self->typemap->{ $type }) {
            return $self->typemap->{ $type }
        } else {
            warn "Unknown type '$type'";
            return '';
        }
    } else {
        return
    }
}

sub render( $self, $name, $args ) {
    my $template = $self->templates;
    local $OpenAPI::PerlGenerator::Template::info = $self;
    state $mt = Mojo::Template->new->vars(1)->namespace('OpenAPI::PerlGenerator::Template');
    if( ! exists $template->{ $name }) {
        die "Unknown template '$name'";
    }
    #warn "<<$name>>";
    my $res = $mt->render( $template->{ $name }, $args );

    if( ref $res and $res->isa('Mojo::Exception') ) {
        warn "Template '$name' (" . join( ",", keys$args->%* ). ")";
        die $res;
    }
    return $res
}
*include = *include = \&render;

=head2 << ->generate >>

  my @output = $gen->generate();
  for my $package (@output) {
      say "Generating " . $package->{package};
      say $package->{source};
  }

=cut

sub generate( $self, %options ) {
    my $schema = delete $options{ schema } // $self->schema
        or croak "Need a schema";
    my $templates = delete $options{ templates } // $self->templates;
    my $prefix = delete $options{ prefix } // $self->prefix;

    my @res;

    my @packages;

    # Fix up the schema to resolve JSON-style refs into real refs:
    $schema = fixup_json_ref( $schema );

    push @res, $self->generate_schema_classes(
        schema => $schema,
        templates => $templates,
        prefix => $prefix,
    );

    my $methods = $self->openapi_method_list(
        schema => $schema,
    );

    push @res, $self->generate_client_implementation(
        methods => $methods,
        prefix => $prefix,
        name => 'Client::Impl',
        schema => $schema,
        templates => $templates,
        %options
    );

    push @res, $self->generate_client(
        methods => $methods,
        prefix => $prefix,
        name => 'Client',
        schema => $schema,
        templates => $templates,
        %options
    );

    return @res
}

sub generate_schema_classes( $self, %options ) {
    my $schema = delete $options{ schema } // $self->schema;
    my $templates = delete $options{ templates } // $self->templates;
    my $run_perltidy = delete $options{ tidy } // $self->tidy;

    $options{ prefix } //= $self->prefix;

    my @res;

    for my $name ( sort keys $schema->{components}->{schemas}->%*) {
        my $elt = $schema->{components}->{schemas}->{$name};
        $elt->{name} //= $name;
        my $type = $elt->{type};

        if( exists $elt->{allOf}) {
            # We should synthesize the real type here instead of punting
            $type = 'object';
        };

        my %info = (
            %options,
            name => $name,
            type => $type,
            elt  => $elt,
        );

        if( exists $self->templates->{ $type }) {
            my $filename = $self->filename( $name, $options{ prefix } );
            my $content = $self->render( $type, \%info );
            if( defined $content ) {
                if( $run_perltidy ) {
                    $content = OpenAPI::PerlGenerator::Utils::tidy( $content );
                }
                push @res, {
                    filename => $filename,
                    package => $self->full_package($name, $options{ prefix }),
                    source   => $content,
                };
            } else {
                # There was an error in this template...
            }

        } elsif( $type eq 'string' ) {
            # Don't output anything, this should likely become an Enum in the
            # type checks instead

        } else {
            warn "No template for type '$type' ($name)";
        }
    };

    return @res
}

sub openapi_method_list( $self, %options ) {
    my $schema = delete $options{ schema } // $self->schema;

    my @methods;

    # Add the methods to the main class (or, also to the current class, depending
    # on tree depth?!
    for my $path (sort keys $schema->{paths}->%*) {
        my $loc = $schema->{paths}->{$path};

        for my $method (sort keys $loc->%*) {
            my $elt = $loc->{$method};

            my $name = $elt->{operationId} // join "_", $path, $method;
            $name =~ s!\W!_!g;

            my %info = (
                path => $path,
                name => $name,
                method => $elt->{method},
                http_method => $method,
                elt  => $elt,
            );

            push @methods, \%info;
        }
    }

    return \@methods
}

sub generate_client_implementation( $self, %options ) {
    my $schema = delete $options{ schema } // $self->schema;
    my $methods = delete $options{ methods } // $self->openapi_method_list( schema => $schema );
    $options{ prefix } //= $self->prefix;

    my $content = $self->render('client_implementation',{
        methods => $methods,
        name => 'Client::Impl',
        schema => $schema,
        %options
    });
    return {
        filename => $self->filename('Client::Impl',$options{ prefix }),
        package => $self->full_package('Client::Impl',$options{ prefix }),
        source   => $content,
    };
}

sub generate_client( $self, %options ) {
    my $schema = delete $options{ schema } // $self->schema;
    my $methods = delete $options{ methods } // $self->openapi_method_list( schema => $schema );
    $options{ prefix } //= $self->prefix;
    my $content = $self->render('client', {
        methods => $methods,
        name => 'Client',
        schema => $schema,
        %options
    });
    return {
        filename => $self->filename('Client',$options{ prefix }),
        package => $self->full_package('Client',$options{ prefix }),
        source   => $content,
    };
}

=head2 C<< ->load_schema >>

  my $res = $gen->load_schema(
      schema => $schema,
      prefix => 'My::Schema',
  );

Compiles the packages and installs them in the namespace given.

=cut

sub load_schema( $self, %options ) {
    $options{ packages } //= [$self->generate(
        %options,
    )];
    my @packages = $options{ packages }->@*;

    my @errors;

    for my $package (@packages) {
        eval $package->{source};
        if( $@ ) {
            push @errors, +{
                name     => $package->{name},
                filename => $package->{filename},
                message  => "$@",
            };
        };

    }

    return {
        errors => \@errors,
        packages => \@packages,
    };
}


# This stuff should go into an OpenAPI schema helper module

sub openapi_submodules( $self, $schema ) {
    $schema //= $self->schema;
    my $schemata = $schema->{components}->{schemas};
    map { $_ => $schemata->{ $_ } } sort keys $schemata->%*
}

sub openapi_response_content_types( $self, $elt ) {
    my %known;
    for my $code (sort keys $elt->{responses}->%*) {
        my $info = $elt->{responses}->{ $code };
        for my $ct (sort keys $info->{content}->%*) {
            $known{ $ct } = 1;
        };
    };
    return sort keys %known;
}

sub openapi_http_code_match( $self, $code ) {
    if( $code eq 'default' ) {
        return q{};

    } elsif( $code =~ /x/i ) {
        (my $re = $code) =~ s/x/./gi;
        return qq{=~ /$re/};

    } else {
        return qq{== $code};
    }
}

1;
__END__
0000: POST /load HTTP/1.1
0015: Host: 192.168.1.97:8080
002e: User-Agent: curl/7.88.1
0047: Accept: */*
0054: Content-Length: 164
0069: Content-Type: multipart/form-data; boundary=--------------------
00a9: ----6aefc0639f22d13e
00bf:
=> Send data, 164 bytes (0xa4)
0000: --------------------------6aefc0639f22d13e
002c: Content-Disposition: form-data; name="model"
005a:
005c: models/ggml-large-v3.bin
0076: --------------------------6aefc0639f22d13e--
