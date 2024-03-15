package main;
use 5.036;
use experimental 'signatures';
use experimental 'for_list';
use Getopt::Long;
use Mojo::Template;
use JSON::Pointer;
use YAML::PP;

use OpenAPI::PerlGenerator::Utils 'tidy', 'update_file';

=head1 NAME

openapi-codegen.pl - create and maintain (client) libraries from OpenAPI / Swagger spec

=cut

GetOptions(
    'package|p=s' => \my $package,
    'force|f'     => \my $force,
    'output|o=s'  => \my $output_directory,
    'api|a=s'     => \my $api_file,
    'tidy'        => \my $run_perltidy,
    'compile'     => \my $check_compile,
);
$package //= 'AI::Ollama';
$api_file //= 'ollama/ollama-curated.yaml';
$output_directory //= '.';

my $schema = YAML::PP->new( boolean => 'JSON::PP' )->load_file( $api_file );

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

# Fix up the schema to resolve JSON-style refs into real refs:
$schema = fixup_json_ref( $schema );

sub filename( $name ) {
    return ("lib\::$package\::$name.pm" =~ s!::!/!gr);
}

my @methods;
my @packages;

my %typemap = (
    string => 'Str',
    number => 'Num',
    integer => 'Int',
    #boolean => 'Bool', # a conflict between JSON::PP::Boolean and Type::Tiny
    boolean => '', # a conflict between JSON::PP::Boolean and Type::Tiny
    object  => 'Object',
);

sub map_type( $elt ) {
    # Do we want to be this harsh?!
    die "No type information found in $elt?!"
        unless $elt->{type};
    my $type = $elt->{type};

    if( $type eq 'array' ) {
        die "Array type has no subtype?!"
            unless $elt->{items};
        my $subtype = map_type( $elt->{items} );
        return "ArrayRef[$subtype]"
    } elsif( exists $typemap{ $type }) {
        return $typemap{ $type }
    } else {
        warn "Unknown type '$type'";
        return '';
    }
}

sub openapi_submodules( $schema ) {
    my $schemata = $schema->{components}->{schemas};
    map { $_ => $schemata->{ $_ } } sort keys $schemata->%*
}

sub openapi_response_content_types( $elt ) {
    my %known;
    for my $code (sort keys $elt->{responses}->%*) {
        my $info = $elt->{responses}->{ $code };
        for my $ct (sort keys $info->{content}->%*) {
            $known{ $ct } = 1;
        };
    };
    return sort keys %known;
}

sub openapi_http_code_match( $code ) {
    if( $code eq 'default' ) {
        return q{};

    } elsif( $code =~ /x/i ) {
        (my $re = $code) =~ s/x/./gi;
        return qq{=~ /$re/};

    } else {
        return qq{== $code};
    }
}

my %template;

sub render( $name, $args ) {
    state $mt = Mojo::Template->new->vars(1)->namespace('main');
    if( ! exists $template{ $name }) {
        die "Unknown template '$name'";
    }
    return $mt->render( $template{ $name }, $args )
}
*include = \&render;

my %locations;
sub elsif_chain($id) {
    # Ignore all Mojo:: stuff!
    my $level = 0;
    if( !$locations{ $id }++) {
        return "if"
    #} elsif( $final ) {
    #    return " else "
    } else {
        return "} elsif"
    }
}

$template{required_parameters} = <<'__REQUIRED_PARAMETERS__';
%# Check that we received all required parameters:
% if( my $p = $elt->{parameters}) {
%     my @required = grep { $_->{required} } $elt->{parameters}->@*;
%     if( @required ) {
%         for my $p (@required) {
    croak "Missing required parameter '<%= $p->{name} %>'"
        unless exists $options{ '<%= $p->{name} %>' };
%         }

%     }
% } # parameter-required
__REQUIRED_PARAMETERS__

$template{path_parameters} = <<'__PATH_PARAMETERS__';
    my $template = URI::Template->new( '<%= $method->{path} %>' );
    my $path = $template->process(
%     for my $p ($params->@*) {
%         if( $p->{required} ) {
              '<%= $p->{name} %>' => delete $options{'<%= $p->{name} %>'},
%         } else {
        maybe '<%= $p->{name} %>' => delete $options{'<%= $p->{name} %>'},
%         }
%     }
    );
__PATH_PARAMETERS__

$template{generate_request_body} = <<'__REQUEST_BODY__';
%     for my $ct (sort keys $content->%*) {
%         if( $content->{$ct}->{schema}) {
    my $request = <%= $prefix %>::<%= $content->{$ct}->{schema}->{name} %>->new( \%options );
%         } else {
              # don't know how to handle this content type...
%         }
%     }
__REQUEST_BODY__

$template{inflated_response} = <<'__INFLATED_RESPONSE__';
%               if( my $restype = $info->{content}->{$ct}->{schema}) {
<%= $prefix %>::<%= $restype->{name} %>->new($payload),
%               } else {
$payload
%               }
__INFLATED_RESPONSE__

$template{streaming_response} = <<'__STREAMING_RESPONSE__';
    use Future::Queue;
    my $queue = Future::Queue->new;
    my $res = $queue->head;
    our @store; # we should use ->retain() instead
    push @store, $r1->then( sub( $tx ) {
        my $resp = $tx->res;
        # Should we validate using OpenAPI::Modern here?!
%# Should this be its own subroutine instead?!
% for my $code (sort keys $elt->{responses}->%*) {                             # response code s
%     my $info = $elt->{responses}->{ $code };
%# XXX if streaming, we need to handle a non-streaming error response!
        <%= elsif_chain($name) %>( $resp->code <%= openapi_http_code_match( $code ) %> ) {
%     if( $info->{description} =~ /\S/ ) {
            # <%= $info->{description} %>
%     }
%       # Check the content type
%       # Will we always have a content type?!
%       if( keys $info->{content}->%* ) {
%           for my $ct (sort keys $info->{content}->%*) {
            my $ct = $resp->headers->content_type;
            return unless $ct;
            $ct =~ s/;\s+.*//;
            if( $ct eq '<%= $ct %>' ) {
                # we only handle ndjson currently
                my $handled_offset = 0;
                $resp->on(progress => sub($msg,@) {
                    my $fresh = substr( $msg->body, $handled_offset );
                    my $body = $msg->body;
                    $body =~ s/[^\r\n]+\z//; # Strip any unfinished line
                    $handled_offset = length $body;
                    my @lines = split /\n/, $fresh;
                    for (@lines) {
                        my $payload = decode_json( $_ );
                        $queue->enqueue(
                            <%= include('inflated_response', { info => $info, prefix => $prefix, ct => $ct, } ) %>
                        );
                    };
                    if( $msg->{state} eq 'finished' ) {
                        $queue->shutdown();
                    }
                });
            }
%           }
%           } else { # we don't know how to handle this, so pass $res          # known content types?
%# XXX should we always use ->done or should we use ->fail for 4xx and 5xx ?!
            return Future::Mojo->done($resp);
%           }
% }
        } else {
            # An unknown/unhandled response, likely an error
            return Future::Mojo->fail($resp);
        }
    });

    $tx->res->once( progress => sub($msg, @) {
        $r1->resolve( $tx );
        undef $r1;
    });
    state $_tx = $self->ua->start_p($tx);
__STREAMING_RESPONSE__

$template{synchronous_response} = <<'__SYNCHRONOUS_RESPONSE__';
    my $res = $r1->then( sub( $tx ) {
        my $resp = $tx->res;
        # Should we validate using OpenAPI::Modern here?!
%# Should this be its own subroutine instead?!
% my $first_code = 1;
% for my $code (sort keys $elt->{responses}->%*) {                             # response code s
%     my $info = $elt->{responses}->{ $code };
%# XXX if streaming, we need to handle a non-streaming error response!
        <%= elsif_chain($name) %>( $resp->code <%= openapi_http_code_match( $code ) %> ) {
%     if( $info->{description} =~ /\S/ ) {
            # <%= $info->{description} %>
%     }
%       # Check the content type
%       # Will we always have a content type?!
%       if( keys $info->{content}->%* ) {
%           for my $ct (sort keys $info->{content}->%*) {
            my $ct = $resp->headers->content_type;
            $ct =~ s/;\s+.*//;
            if( $ct eq '<%= $ct %>' ) {
%# These handlers for content types should come from templates? Or maybe
%# from a subroutine?!
%               if( $ct eq 'application/json' ) {
                my $payload = $resp->json();
%               } elsif( $ct eq 'application/x-ndjson' ) {
                # code missing to hack up ndjson into hashes for a non-streaming response
                my $payload = $resp->body();
%               } else {
                my $payload = $resp->body();
%               }
                return Future::Mojo->done(
                    <%= include('inflated_response', { info => $info, prefix => $prefix, ct => $ct, } ) %>
                );
            }
%           }
%           } else { # we don't know how to handle this, so pass $res          # known content types?
            return Future::Mojo->done($resp);
%           }
% }
        } else {
            # An unknown/unhandled response, likely an error
            return Future::Mojo->fail($resp);
        }
    });

    # Start our transaction
    $tx = $self->ua->start_p($tx)->then(sub($tx) {
        $r1->resolve( $tx );
        undef $r1;
    });
__SYNCHRONOUS_RESPONSE__

$template{object} = <<'__OBJECT__';
package <%= $prefix %>::<%= $name %> 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

% for my $prop (sort keys $elt->{properties}->%*) {
%     my $p = $elt->{properties}->{$prop};
=head2 C<< <%= $prop %> >>

% if( $p->{description} and $p->{description} =~ /\S/ ) {
<%= $p->{description} =~ s/\s*$//r %>

% }
=cut

has '<%= $prop %>' => (
    is       => 'ro',
% my $type = map_type( $p );
% if( $type ) {
    isa      => <%= $type %>,
% };
% if( grep {$_ eq $prop} $elt->{required}->@*) {
    required => 1,
% }
);

% }

1;
__OBJECT__

$template{client_implementation} = <<'__CLIENT__';
package <%= $prefix %>::<%= $name %> 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use PerlX::Maybe;
use Carp 'croak';

# These should go into a ::Role
use YAML::PP;
use Mojo::UserAgent;
use Mojo::URL;
use Mojo::JSON 'encode_json', 'decode_json';
use OpenAPI::Modern;

use Future::Mojo;

% for my ($submodule,$info) (openapi_submodules($schema)) {
%     if( $info->{type} eq 'object' ) {
use <%= $prefix %>::<%= $submodule %>;
%     }
% }

=head1 SYNOPSIS

=head1 PROPERTIES

=head2 B<< openapi >>

=head2 B<< ua >>

=head2 B<< server >>

=cut

# XXX this should be more configurable, and potentially you don't want validation?!
my $schema = YAML::PP->new( boolean => 'JSON::PP' )->load_file( 'ollama/ollama-curated.yaml' );
has 'openapi' => (
    is => 'lazy',
    default => sub { OpenAPI::Modern->new( openapi_schema => $schema, openapi_uri => '/api' )},
);

# The HTTP stuff should go into a ::Role I guess
has 'ua' => (
    is => 'lazy',
    default => sub { Mojo::UserAgent->new },
);

has 'server' => (
    is => 'lazy',
    default => sub { 'http://localhost:11434/api' }, # XXX pull from OpenAPI file instead
);

=head1 METHODS

% for my $method ($methods->@*) {
% my $elt = $method->{elt};
% my $is_streaming =    exists $elt->{responses}->{200}
%                    && $elt->{responses}->{200}->{content}
%                    && [keys $elt->{responses}->{200}->{content}->%*]->[0] eq 'application/x-ndjson'
%                    ;
%
%# Sort the parameters according to where they go
% my %parameters;
% if( my $p = $elt->{parameters}) {
%     for my $p ($elt->{parameters}->@*) {
%         $parameters{ $p->{in} } //= [];
%         push $parameters{ $p->{in} }->@*, $p;
%     }
% }
%
=head2 C<< <%= $method->{name} %> >>

%# Generate the example invocation
% if( $is_streaming ) {
  use Future::Utils 'repeat';
  my $tx = $client-><%= $method->{name} %>();
  repeat {
      my( $next, $resp ) = $tx->get;
      # ...
      $tx = $next;

      Future::Mojo->done( defined $resp );
  } until => sub($done) { $done->get };
% } else {
  my $res = $client-><%= $method->{name} %>()->get;
% }

% if( $elt->{summary}  and $elt->{summary} =~ /\S/ ) {
<%= $elt->{summary} =~ s/\s*$//r; %>

%}
%# List/add the invocation parameters
% my $parameters = $elt->{parameters};
% if( $parameters ) { # parameters
=head3 Parameters

=over 4

%     for my $p ($parameters->@* ) {
=item B<< <%= $p->{name} %> >>

% if( $p->{description} =~ /\S/ ) {
<%= $p->{description} =~ s/\s*$//r %>

% }
%     }
=back

% } # parameters
%#
%# Add the body/schema parameters:
% (my $ct) = keys $elt->{requestBody}->{content}->%*;
% my $type;
% if( $ct ) {
%     $type = $ct && $elt->{requestBody}->{content}->{$ct}->{schema};
% };
% if( $type ) {
%     my @properties = (sort keys $type->{properties}->%*);
%     if( @properties ) {

=head3 Options

=over 4

%         for my $prop (@properties) {
%             my $p = $type->{properties}->{$prop};
=item C<< <%= $prop %> >>

% if( $p->{description} ) {
<%= $p->{description} =~ s/\s*$//r %>
% }
%         }
=back
%     }
% }

% for my $code (sort keys $elt->{responses}->%*) {
%     my $info = $elt->{responses}->{ $code };
%        if( my $content = $info->{content} ) {
%            for my $ct (sort keys $content->%*) {
%                if( $content->{$ct}->{schema}) {
Returns a L<< <%= $prefix %>::<%= $content->{$ct}->{schema}->{name} %> >>.
%                }
%             }
%         }
%     }

=cut

sub <%= $method->{name} %>( $self, %options ) {
<%= include( 'required_parameters', { elt => $elt }); =%>
%#
    my $method = '<%= uc $method->{http_method} %>';
%# Output the path parameters
% if( my $params = delete $parameters{ path }) {
<%= include( 'path_parameters', { method => $method, params => $params }); =%>
% } else {
    my $path = '<%= $method->{path} %>';
% } # path parameters
    my $url = Mojo::URL->new( $self->server . $path );

%#------
%# Generate the (URL) parameters
%# This must happen before the remaining options are passed into an object
%# Output the query parameters
% if( my $params = delete $parameters{ query }) {
    $url->query->merge(
%     for my $p ($params->@*) {
%         if( $p->{required} ) {
              '<%= $p->{name} %>' => delete $options{'<%= $p->{name} %>'},
%         } else {
        maybe '<%= $p->{name} %>' => delete $options{'<%= $p->{name} %>'},
%         }
%     }
    );

% };
%#------
%# Generate the header parameters
% my $custom_headers;
% if( my $params = delete $parameters{ header }) {                             # header parameters
%     $custom_headers = [];
%     for my $p ($params->@*) {
%         if( $p->{required} ) {
%             push @$custom_headers, qq{      '$p->{name}' => delete \$options{'$p->{name}'}};
%         } else {
%             push @$custom_headers, qq{maybe '$p->{name}' => delete \$options{'$p->{name}'}};
%         }
%     }
% };                                                                           # header parameters
%#------
%# Output any parameter locations we didn't handle as comment
% for (sort keys %parameters ) {
%     for my $p ($parameters{$_}->@*) {
    # unhandled <%= $p->{in} %> parameter <%= $p->{name} %>;
%     }
% }                         # parameter-in
%
% my $is_json;
% my $content_type;
% if( $elt->{requestBody} ) {
%#    We assume we will only ever have one content type for the request we send:
%     ($content_type) = sort keys $elt->{requestBody}->{content}->%*;
%     $is_json = $ct eq 'application/json';
<%= include('generate_request_body', {
        content => $elt->{requestBody}->{content},
        prefix => $prefix,
        is_json => $is_json,
    } ); =%>
% }
%
    my $tx = $self->ua->build_tx(
        $method => $url,
        {
% my $known_response_types = join ",", openapi_response_content_types($elt);
% if( $known_response_types ) {
            'Accept' => '<%= $known_response_types %>',
% }
% if( $content_type ) {
            "Content-Type" => '<%= $content_type %>',
% }
% if( $custom_headers ) {
%     for my $h (@$custom_headers) {
             <%= $h %>
%     }
% }
%#------
%# Generate the header parameters
% if( my $params = delete $parameters{ header }) {                             # header parameters
%     for my $p ($params->@*) {
%         if( $p->{required} ) {
              '<%= $p->{name} %>' => delete $options{'<%= $p->{name} %>'},
%         } else {
        maybe '<%= $p->{name} %>' => delete $options{'<%= $p->{name} %>'},
%         }
%     }
% };                                                                           # header parameters
        }
% if( $is_json ) {
        => json => $request->as_hash,
% } else {
        # XXX Need to fill the body
        # => $body,
% }
    );

    # validate our request while developing
    my $results = $self->openapi->validate_request($tx->req);
    if( $results->{error}) {
        say $results;
        say $tx->req->to_string;
    };

%# We want to handle both here, streaming (ndjson) and plain responses
%# Plain responses are easy, but for streamed, we want to register an ->on('progress')
%# handler instead of the plain part completely. In the ->on('progress') part,
%# we still run the handler, so maybe that is the same ?!

    my $r1 = Future::Mojo->new();
% if( $is_streaming ) {
<%= include('streaming_response', {
         name => $method->{name},
         elt => $elt,
         prefix => $prefix,
          }); =%>
% } else {
<%= include('synchronous_response', {
         name => $method->{name},
         elt => $elt,
         prefix => $prefix,
         });
=%>
% }

    return $res
}

% }

1;
__CLIENT__

$template{client} = <<'__CLIENT__';
package <%= $prefix %>::<%= $name %> 0.01;
use 5.020;
use Moo 2;
use experimental 'signatures';

extends '<%= $prefix %>::<%= $name %>::Impl';

=head1 NAME

<%= $prefix %>::<%= $name %> - Client for <%= $prefix %>

=head1 SYNOPSIS

  use 5.020;
  use <%= $prefix %>::<%= $name %>;

  my $client = <%= $prefix %>::<%= $name %>->new(
      server => '<%= $schema->{servers}->[0]->{url} // "https://example.com/" %>',
  );
  my $res = $client->someMethod()->get;
  say $res;

=head1 METHODS

% for my $method ($methods->@*) {
% my $elt = $method->{elt};
=head2 C<< <%= $method->{name} %> >>

  my $res = $client-><%= $method->{name} %>()->get;

% if( $elt->{summary} and $elt->{summary} =~ /\S/ ) {
<%= $elt->{summary} =~ s/\s*$//r; %>

%}
% for my $code (sort keys $elt->{responses}->%*) {
%     my $info = $elt->{responses}->{ $code };
%        if( my $content = $info->{content} ) {
%            for my $ct (sort keys $content->%*) {
%                if( $content->{$ct}->{schema}) {
Returns a L<< <%= $prefix %>::<%= $content->{$ct}->{schema}->{name} %> >>.
%                }
%             }
%         }
%     }

=cut

% }
1;
__CLIENT__

my %options = (
    prefix => $package,
);

for my $name ( sort keys $schema->{components}->{schemas}->%*) {
    my $elt = $schema->{components}->{schemas}->{$name};
    $elt->{name} //= $name;
    my $type = $elt->{type};

    my %info = (
        %options,
        name => $name,
        type => $type,
        elt  => $elt,
    );

    if( exists $template{ $type}) {
        my $filename = filename( $name );
        my $content = render( $type, \%info );
        if( $run_perltidy ) {
            $content = tidy( $content );
        }
        update_file(
            filename => $filename,
            output_directory => $output_directory,
            content  => $content,
        );

    } elsif( $type eq 'string' ) {
        # Don't output anything, this should likely become an Enum in the
        # type checks instead

    } else {
        warn "No template for type '$type' ($name)";
    }
}

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

{
# Generate ::Client::Impl
my $content = render('client_implementation',
             {
                methods => \@methods,
                name => 'Client::Impl',
                schema => $schema,
                %options
              });
if( $run_perltidy ) {
    $content = tidy( $content );
};
update_file( filename => filename('Client::Impl'),
             output_directory => $output_directory,
             content => $content,
             );
}

{
# If it does not exist, generate the stub for the main file ::Client as well
# The client consists of "use parent '::Client::Impl';
# and the pod for all the methods, for manual editing.
my $content = render('client',
             {
                methods => \@methods,
                name => 'Client',
                schema => $schema,
                %options
              });
if( $run_perltidy ) {
    $content = tidy( $content );
}
update_file( filename => filename('Client'),
            output_directory => $output_directory,
             keep_existing => 1,
             content => $content,
            );
};

# This is not to be run online, as people could put Perl code into the Prefix
# or any OpenAPI method name for example
if( $check_compile ) {
    push @INC, "./$output_directory/lib";
    my $fn = filename('Client') =~ s!\blib\b/!!r;
    require($fn);
}

=head1 SEE ALSO

The OpenAPI spec - L<https://spec.openapis.org/oas/v3.1.0#openapi-document>

__END__
[ ] Move common parts of POD generation into a subroutine / include()-able
    template
[ ] (optionally) check that the created module file(s) compile
[ ] Split out the templates into separate files
[ ] support parameters in cookies
[ ] Handle variables (at all)
[ ] Handle variables in servers (OpenAPI::Modern dislikes that field):
    servers:
      - url: https://{host}/api/v2
        variables:
          host:
            default: someserver.example
[ ] handle https://raw.githubusercontent.com/OAI/OpenAPI-Specification/master/examples/v3.0/uspto.yaml
[ ] handle https://raw.githubusercontent.com/OAI/OpenAPI-Specification/master/examples/v3.0/petstore-expanded.yaml
[ ] move method call example invocation into a subroutine/subtemplate
[ ] Support "schema" part of parameter joining
[ ] Support multipart/form-data ( https://swagger.io/docs/specification/describing-request-body/ )
[ ] Maybe handle allOf types? This is basically composition, a list of things
    that need to match ...
[ ] Can we qualify documentation for returns "on success" and "on error" from the4 HTTP codes?!
