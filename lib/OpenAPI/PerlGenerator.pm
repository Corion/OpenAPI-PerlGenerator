package OpenAPI::PerlGenerator 0.02;
use 5.022;
use Moo 2;
use Carp 'croak';
use experimental 'signatures'; # actually, they are stable but stable.pm doesn't know
use stable 'postderef';
use List::Util 'uniq';

use Mojo::Template;
use OpenAPI::PerlGenerator::Utils; # for tidy(), but we don't import that
use OpenAPI::PerlGenerator::Template;
use JSON::Pointer;
use Markdown::Pod;
use Cpanel::JSON::XS;

=head1 NAME

OpenAPI::PerlGenerator - create Perl client SDKs from OpenAPI specs

=head1 SYNOPSIS

  my $api_file = slurp( 'petshop.json' );
  my $schema = JSON::PP->new()->decode( $api_file );
  my @files = $gen->generate(
      schema => $schema,
      schema_file => $api_file,
      prefix => "My::API",
  );

This module generates Perl clients for an OpenAPI spec. It generates
a class for each item in the C<< components/schemas >> section.
It generates C<< $prefix::Client::Impl >> as the implementation class of the
client and a stub C<< $prefix::Client >> class for overriding or refining
the autogenerated class.

=head1 METHODS

=head2 C<< new >>

=head3 Options

=over 4

=item * B<schema>

A data structure for the OpenAPI schema

=cut

sub load_schema_file( $self, $schema_file ) {
    croak "No schema filename given"
        unless $schema_file;
    my $f = Mojo::File->new( $schema_file );
    $f =~ /\.json\z/i
    ? JSON::PP->new()->decode( $f->slurp())
    : YAML::PP->new( boolean => 'JSON::PP' )->load_file( $f )
}

has 'schema' => (
    is => 'lazy',
    default => sub( $self ) {
        $self->load_schema_file( $self->schema_file )
    }
);

has 'schema_file' => (
    is => 'ro',
);

our %default_templates;

=item * B<templates>

A hashref of templates to use

=cut

has 'templates' => (
    is => 'lazy',
    default => sub { { %default_templates } },
);

=item * B<prefix>

The prefix for the modules to use

=cut

has 'prefix' => (
    is => 'ro',
);

=item * B<tidy>

Run the resulting code through L<Perl::Tidy>.

Default is true.

=cut

has 'tidy' => (
    is => 'rw',
    default => 1,
);

our %default_typemap = (
    string => 'Str',
    number => 'Num',
    integer => 'Int',
    boolean => '', # a conflict between JSON::PP::Boolean and Type::Tiny
    object  => 'HashRef',
);

=item * B<typemap>

Hashref with the mapping of OpenAPI types to L<Type::Tiny> constraints.

=cut

has 'typemap' => (
    is => 'lazy',
    default => sub { +{ %default_typemap } },
);

=item * B<version>

The version number to give to all modules

=back

=cut

has 'version' => (
    is => 'ro',
    default => '0.01',
);

has 'locations' => (
    is => 'rw',
    default => sub { {} },
);

sub fetch_descriptor( $self, $path, $root = $self->schema ) {
    $path =~ s!^#!!;
    return JSON::Pointer->get($root, $path, 1);
}

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

                (my $name) = ($ref =~ m!/([^/]+)\z!);

                $curr = JSON::Pointer->get($root, $ref, 1);

                # Guard against duplicate references to the same data structure (?!)
                croak "two names for $ref: $curr->{ __name } and $name"
                    if exists $curr->{__name} and $name ne $curr->{__name};

                $curr->{ __name } = $name;

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

sub markdown_to_pod( $self, $str ) {
    state $converter = Markdown::Pod->new();
    return $converter->markdown_to_pod( markdown => $str ) =~ s/\s+\z//r;
}

sub json_pretty( $self, $str, $indent = '  ' ) {
    my $pad = '';
    $str =~ s!\A\s+!!;
    $str =~ s!\s+\z!!;
    #use Regexp::Debugger;
    $str =~ s{(?>\s*(
                 (?<literal>"(?:[^"]*|\\.)"|[\d.]+)
                |(?<colon>:)
                |(?<comma>,)
                |(?<empty>\{\s*\}|\[\s*\])
                |(?<open>[\[\{])
                |(?<close>\]|\})
            )\s*
            ) # we never give anything back
    }{
        my $res;
        if   ( defined $+{literal} ) {
            $res = $+{literal}
        } elsif( defined $+{colon} ) {
            $res = " : ";
        } elsif( defined $+{comma} ) {
            $res = ",\n$pad";
        } elsif( defined $+{empty} ) {
                my $e = $+{empty};
                $e =~ s/\s+//;
                $res = "$e";
        } elsif( defined $+{open} ) {
                $pad .= $indent;
                $res = "$+{open}\n$pad";
        } elsif( defined $+{close} ) {
                substr( $pad, length($pad)-length($indent), length($indent) ) = '';
                $res = "\n$pad$+{close}";
        } else {
          die "This should not happen, was left with '$&'"
        }
        $res
    }grnsex;
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
        return
    }
}

sub property_name( $self, $name ) {
    if( $name !~ /\A[A-Za-z_]/ ) {
        $name = "_" . $name;
    }
    $name =~ s!\W+!_!g;
    return $name
}

# Maybe line-wrap into a comment?!
sub single_line( $self, $str ) {
    $str =~ s/\s+/ /gr;
}

sub perl_comment( $self, $prefix, $str ) {
    if( $str and $str =~ /\S/ ) {
        return $str =~ s/(\A|\n)/\n$prefix# /gr;
    } else {
        return ''
    }
}

=head2 C<< ->find_discriminator >>

Finds the "best" way to discriminate between different types. Assuming that
your OpenAPI spec is sane.

=cut

sub potential_instances( $elt, $candidates={} ) {
    for my $candidate ($elt->{oneOf}->@*) {
        if( $candidate->{oneOf}) {
            potential_instances( $candidate, $candidates );

        } else {
            $candidates->{ $candidate } = $candidate;
        };
    };
    return $candidates
}

sub potential_values( $prop ) {
    if( $prop->{enum} ) {
        #warn "Enum: " . join ", ", map { qq{"$_"} } $prop->{enum}->@*;
        return $prop->{enum}->@*
    } else {
        return
    }
}

sub find_discriminator( $self, $elt, $schema, $prefix=$self->prefix ) {
    my %has_value;
    my %has_property;
    my %has_type;

    my $idx = 0;
    my $candidates = potential_instances( $elt );

    for my $impl (values $candidates->%*) {
        $idx++;
        my $class = $impl;
        if( ! ref $class) {
            if( $class =~ /^#/ ) {
                my $name = ($class =~ m!\b(\w+)\z!);
                $class = $self->fetch_descriptor( $impl, $schema );
                $class->{name} //= $name;

            } else {
                # Is a simple type
                $has_type{ $class }->{ $idx } = $impl;
                # Maybe it has an enum or value?!
            }
        };
        if( ref $class ) {
            for my $prop (sort keys $class->{properties}->%*) {
                $has_property{ $prop } //= {};
                $has_property{ $prop }->{$idx} = 1;
                $has_value{ $prop } //= {};
                for my $value (potential_values($class->{properties}->{$prop})) {
                    #warn "$prop = '$value' => $idx";

                    # This means that two { "foo": "bar" } instances are always
                    # different, but we'll start out with that. If we want these
                    # to be equal (types), we'll need to create a type signature
                    $has_value{ $prop }->{$value}->{$class} = $class;

                    #if( $class->{name} ) {
                    #    $has_value{ $prop }->{$value}->{$class} = $self->full_package( $class->{name}, $prefix );
                    #} elsif( $class->{type} ) {
                    #    $has_value{ $prop }->{$value}->{$class} = $class->{type};
                    #    $has_value{ $prop }->{$value}->{$class} = $class;
                    #}
                };
            }
        }
    }

    my ($discriminator, $mapping);
    COMMON_PROPERTY: for my $d (keys %has_value) {
        my @once = grep { scalar keys($_->%*) == 1 } values $has_value{ $d }->%*;
        if( @once == keys $candidates->%* ) {
            #warn "Found discriminator field '$d'";
            # There is a common field that all variants share, and each value only
            # ever occurs once:
            $discriminator = $d;
            $mapping = +{
                map {;
                    my ($val) = $_;
                    my ($class) = values $has_value{ $d }->{ $val }->%*;

                    # Here, we need to store the different kinds of fields
                    # we expect in the object!

                    $_ => ($class // $_)
                } keys $has_value{ $discriminator }->%*
                #} values $candidates->%*
            };
            last COMMON_PROPERTY;
        };
    };

    if( $discriminator ) {
        my $res = {
            discriminator => $discriminator,
            mapping       => $mapping,
        };
        return $res;
    } else {

        # We should check the different return types here

        #use Data::Dumper;
        #warn "Couldn't find a (single-field) discriminator for " . Dumper $candidates;
        warn "Couldn't find a (single-field) discriminator for some result";
    };

    return {
        discriminator => undef,
        mapping => undef,
    }

}

=head2 C<< ->resolve_schema >>

  my( $type, $classname ) = $self->resolve_schema($schema);

Resolves a C<schema> entry into its basic type and additional data.

In the case where C<$schema> contains a C<oneOf> stanza, it returns C<oneof>
and a hashref with a C<discriminator> entry that names the field, and a hashref
mapping field values to classnames:

  {
      discriminator => 'type',
      mapping => {
          string => 'Example::String',
          number => 'Example::Number',
      }
  }

For more complex items, a reference to the schema hashref will be returned
to allow for better downstream type checking.

=cut

sub resolve_schema( $self, $schema_entry, $prefix, $schema, $schema_file ) {
    my $t = $schema_entry->{type} // '';
    if ( exists $schema_entry->{oneOf} and $schema_entry->{oneOf}->@* == 1) {
        return $self->resolve_schema( $schema_entry->{oneOf}->[0], $prefix, $schema, $schema_file );

    } elsif( exists $schema_entry->{oneOf} and $schema_entry->{oneOf}->@* > 1) {
        if( my $d = $schema_entry->{discriminator} ) {
            my $s = $schema;
            my $res = {
                discriminator => $d->{propertyName},
                mapping => {
                    map {
                        (my $name) = ($d->{mapping}->{$_} =~ /\b(\w+)$/);
                        $_ => $self->full_package( $name, $prefix ),
                    } keys $d->{mapping}->%*
                },
            };
            return ('oneOf', $res);

        } else {
            #warn "Don't know how to resolve oneOf without a discriminator entry";
            #warn "Guessing the best class is still open";

            return ('oneOf', $self->find_discriminator( $schema_entry, $schema, $prefix ));
        }

    } elsif( exists $schema_entry->{name} ) {
        return ('class', $prefix . "::" . $schema_entry->{name})

    } elsif( $t ) {
        return( $t, undef );

    } elsif( ! keys $schema_entry->%* ) {
        # We'll just assume JSON here
        return ('object', undef);

    } else {
        use Data::Dumper;
        warn "Don't know how to derive a type for schema " . Dumper $schema_entry;
        return ('object', undef);
    }
}

=head2 C<< class_type_name >>

Returns a user-facing class-name for an OpenAPI schema entry

=cut

sub class_type_name( $self, $prefix, $info ) {
    if( ref $info and $info->{__name}) {
        return "$prefix\::" . $info->{__name};

    } elsif( ref $info and $info->{type} eq 'object') {
        return 'HashRef'

    } elsif( ref $info ) {
        use Data::Dumper;
        die Dumper $info;

    } else {
        return $info
    }
}

=head1 METHODS

=head2 C<< ->render( $name, $args ) >>

  my $str = $gen->render('template_body', { prefix => 'My::API' } );

Render a template

=cut

sub render( $self, $name, $args ) {
    my $template = $self->templates;
    local $OpenAPI::PerlGenerator::Template::info = $self;
    state $mt = Mojo::Template->new->vars(1)->namespace('OpenAPI::PerlGenerator::Template');
    if( ! exists $template->{ $name }) {
        die "Unknown template '$name'";
    }
    my $res = $mt->render( $template->{ $name }, $args );

    if( ref $res and $res->isa('Mojo::Exception') ) {
        warn "Template '$name' (" . join( ",", keys$args->%* ). ")";
        die $res;
    }
    return $res
}
*include = *include = \&render;

=head2 << ->generate( %options ) >>

  my @output = $gen->generate();
  for my $package (@output) {
      say "Generating " . $package->{package};
      say $package->{source};
  }

Generate the packages from the templates.

=cut

sub _schema_parameters( $self, $options ) {
    my $schema_file = $options->{ schema_file } // $self->schema_file
        or croak "Need a schema file here";
    my $schema = $options->{schema} ? $options->{ schema }
               : $schema_file     ? $self->load_schema_file( $schema_file )
               : $self->schema
        or croak "Need a schema";
    my $methods = $options->{ methods } // $self->openapi_method_list(
        schema => $schema,
        schema_file => $schema_file,
    );
    return ($schema, $schema_file, $methods);
}

sub generate( $self, %options ) {
    my ($schema, $schema_file, $methods) = _schema_parameters( $self, \%options );
    my $templates = delete $options{ templates } // $self->templates;
    my $prefix = delete $options{ prefix } // $self->prefix;
    my $version = delete $options{ version } // $self->version;

    my @res;

    my @packages;

    # Fix up the schema to resolve JSON-style refs into real refs:
    $schema = fixup_json_ref( $schema );

    push @res, $self->generate_schema_classes(
        schema => $schema,
        schema_file => $schema_file,
        templates => $templates,
        prefix => $prefix,
        version => $version,
    );

    push @res, $self->generate_client_implementation(
        %options,
        methods => $methods,
        prefix => $prefix,
        name => 'Client::Impl',
        schema => $schema,
        schema_file => $schema_file,
        templates => $templates,
        version => $version,
    );

    push @res, $self->generate_client(
        methods => $methods,
        prefix => $prefix,
        name => 'Client',
        schema => $schema,
        schema_file => $schema_file,
        templates => $templates,
        version => $version,
        %options
    );

    return @res
}

sub openapi_dependencies( $self, %options ) {
    my $class  = delete $options{ type }
        or croak "Need a 'type' parameter";
    my ($schema, $schema_file,$methods) = _schema_parameters( $self, \%options );
    my $prefix = delete $options{ prefix } // $self->prefix;

    my ($type, $info) = $self->resolve_schema($class, $prefix, $schema, $schema_file);
    if( ref $info ) {
        my @subclasses = uniq sort grep { $_ ne 'HashRef' }
                              map { $self->class_type_name( $prefix, $_) }
                              values $info->{mapping}->%*;
        return @subclasses
    } else {
        return
    }
}

sub generate_schema_classes( $self, %options ) {
    my ($schema, $schema_file, $methods) = _schema_parameters( $self, \%options );
    my $templates = delete $options{ templates } // $self->templates;
    my $run_perltidy = delete $options{ tidy } // $self->tidy;

    $options{ prefix } //= $self->prefix;

    my @res;

    my %dependencies;

    for my $name ( sort keys $schema->{components}->{schemas}->%*) {
        my $elt = $schema->{components}->{schemas}->{$name};
        $elt->{name} //= $name;
        my $type = $elt->{type};

        if( exists $elt->{allOf}) {
            # We should synthesize the real type here instead of punting
            $type = 'object';
        } elsif( exists $elt->{oneOf}) {

            $type = 'oneOfObject';
        };

        my %info = (
            %options,
            schema => $schema,
            schema_file => $schema_file,
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
                    prerequisites => [ $self->openapi_dependencies( schema => $schema, schema_file => $schema_file, type => $elt, prefix => $options{ prefix }) ],
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

    # now, sort @res topologically so we can require one file after another
    my %written;
    my @out;
    my @retry;
    while( @res ) {
        my $f = shift @res;
        if( (grep { !$written{ $_ } } $f->{prerequisites}->@*) == 0 ) {
            push @out, $f;
            $written{ $f->{package} }++;
            unshift @res, splice @retry;
        } else {
            push @retry, $f;
        };
    };

    return @out
}

sub openapi_method_list( $self, %options ) {
    my $schema = delete $options{ schema }
        or croak 'Need a schema to build the method list';

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

sub elsif_chain($self, $id) {
    # Ignore all Mojo:: stuff!
    my $locations = $self->locations;

    if( !$locations->{ $id }++) {
        return "if"
    #} elsif( $final ) {
    #    return " else "
    } else {
        return "} elsif"
    }
}

sub generate_client_implementation( $self, %options ) {
    my ($schema, $schema_file, $methods) = _schema_parameters( $self, \%options );
    $options{ prefix } //= $self->prefix;

    $self->locations( {} );

    my $content = $self->render('client_implementation',{
        methods => $methods,
        name => 'Client::Impl',
        schema => $schema,
        schema_file => $schema_file,
        %options
    });
    return {
        filename => $self->filename('Client::Impl',$options{ prefix }),
        package => $self->full_package('Client::Impl',$options{ prefix }),
        source   => $content,
    };
}

sub generate_client( $self, %options ) {
    my ($schema, $schema_file, $methods) = _schema_parameters( $self, \%options );
    $options{ prefix } //= $self->prefix;

    $self->locations( {} );

    my $content = $self->render('client', {
        methods => $methods,
        name => 'Client',
        schema => $schema,
        schema_file => $schema_file,
        %options
    });
    return {
        filename => $self->filename('Client',$options{ prefix }),
        package => $self->full_package('Client',$options{ prefix }),
        source   => $content,
    };
}

=head2 C<< ->load_schema( %options ) >>

  my $res = $gen->load_schema(
      schema => $schema,
      prefix => 'My::Schema',
  );

Compiles the packages and installs them in the current process
with the namespace given.

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

=head1 REPOSITORY

The public repository of this module is
L<https://github.com/Corion/OpenAPI-PerlGenerator>.

=head1 SUPPORT

The public support forum of this module is L<https://perlmonks.org/>.

=head1 BUG TRACKER

Please report bugs in this module via the Github bug queue at
L<https://github.com/Corion/OpenAPI-PerlGenerator/issues>

=head1 AUTHOR

Max Maischein C<corion@cpan.org>

=head1 COPYRIGHT (c)

Copyright 2024- by Max Maischein C<corion@cpan.org>.

=head1 LICENSE

This module is released under the Artistic License 2.0.

=cut
