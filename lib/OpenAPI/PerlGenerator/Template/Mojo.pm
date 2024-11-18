package OpenAPI::PerlGenerator::Template::Mojo 0.02;
use 5.020;

=head1 NAME

OpenAPI::PerlGenerator::Template::Mojo - Mojolicious templates for OpenAPI clients

=head1 SYNOPSIS

  # override the 'foo' template
  $OpenAPI::PerlGenerator::Template::Mojo::template{'foo'} = <<__MY_TEMPLATE__;
  bar
  __MY_TEMPLATE__

=cut

our %template;

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
%         if( exists $content->{$ct}->{schema}) {
% warn "No prefix?!" unless $prefix;
%             my( $type, $class) = resolve_schema( $content->{$ct}->{schema}, $prefix );
%             if( $type eq 'string' ) {
    my $body = delete $options{ body } // '';
%             } elsif( $type eq 'array' ) {
    my $body = delete $options{ body } // ''; # ??? really? This is an "array"
%             } elsif( $type eq 'object' ) {
    my $request = \%options;
%             } elsif( $type eq 'class') {
%                 if( $class ) {
    my $request = <%= $class %>->new( \%options )->as_hash;
%                 } else {
    # Let's hope that the content type was application/json ...
    my $request = \%options;
%                 }
%             } else {
    # Don't know how to handle request type '$type'
    my $request = <%= $class %>->new( \%options )->as_hash;
%             }
%         } elsif( $ct eq 'multipart/form-data' ) {
%             # nothing to do
%         } else {
              # don't know how to handle content type <%= $ct %>...
%         }
%     }
__REQUEST_BODY__

$template{inflated_response} = <<'__INFLATED_RESPONSE__';
% my( $vtype, $class) = resolve_schema( $type, $prefix );
%# use Data::Dumper; warn Dumper [$vtype, $class];
% if( $vtype eq 'oneOf' and $class->{discriminator}) { # multiple potential types with a single field to check
% use Data::Dumper; warn Dumper [$vtype, $class];
% die;
% } elsif( $type->{name} ) {
<%= $prefix %>::<%= $type->{name} %>->new(<%= $argname %>),
% } elsif( $type->{type} and $type->{type} eq 'array') {
[ map { <%= include('inflated_response', { type => $type->{items}, prefix => $prefix, argname => '$_' }) %> } $payload->@* ],
% } else {
<%= $argname %>
% }
__INFLATED_RESPONSE__

$template{streaming_response} = <<'__STREAMING_RESPONSE__';
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
            # <%= single_line( $info->{description} ) %>
            my $queue = Future::Queue->new( prototype => 'Future::Mojo' );
            $res->done( $queue );
%     }
%       # Check the content type
%       # Will we always have a content type?!
%       if( keys $info->{content}->%* ) {
            my $ct = $resp->headers->content_type;
            return unless $ct;
%           for my $ct (sort keys $info->{content}->%*) {
            $ct =~ s/;\s+.*//;
            <%= elsif_chain("$name/$code/content-type") %>( $ct eq '<%= $ct %>' ) {
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
                        if(     $self->validate_responses
                            and my $openapi = $self->openapi ) {
                            my $results = $openapi->validate_response($payload, { request => $tx->req });
                            if( $results->{error}) {
                                say $results;
                                say $tx->res->to_string;
                            };
                        };
                        $queue->push(
% my $type = $info->{content}->{$ct}->{schema};
                            <%= include('inflated_response', { type => $type, prefix => $prefix, argname => '$payload' } ) %>
                        );
                    };
                    if( $msg->{state} eq 'finished' ) {
                        $queue->finish();
                    }
                });
            } else {
                # Unknown/unhandled content type
                $res->fail( sprintf("unknown_unhandled content type '%s'", $resp->content_type), $resp );
            }
%           }
%           } else { # we don't know how to handle this, so pass $res          # known content types?
%# XXX should we always use ->done or should we use ->fail for 4xx and 5xx ?!
            $res->done($resp);
%           }
% }
        } else {
            # An unknown/unhandled response, likely an error
            $res->fail( sprintf( "unknown_unhandled code %d", $resp->code ), $resp);
        }
    });

    my $_tx;
    $tx->res->once( progress => sub($msg, @) {
        $r1->resolve( $tx );
        undef $_tx;
        undef $r1;
    });
    $_tx = $self->ua->start_p($tx);
__STREAMING_RESPONSE__

$template{synchronous_response} = <<'__SYNCHRONOUS_RESPONSE__';
    $r1->then( sub( $tx ) {
        my $resp = $tx->res;
        # Should we validate using OpenAPI::Modern here?!
%# Should this be its own subroutine instead?!
% my $first_code = 1;
% for my $code (sort keys $elt->{responses}->%*) {                             # response code s
%     my $info = $elt->{responses}->{ $code };
        <%= elsif_chain($name) %>( $resp->code <%= openapi_http_code_match( $code ) %> ) {
%     if( $info->{description} =~ /\S/ ) {
            # <%= single_line( $info->{description} ) %>
%     }
%       # Check the content type
%       # Will we always have a content type?!
%       if( keys $info->{content}->%* ) {
            my $ct = $resp->headers->content_type;
            $ct =~ s/;\s+.*//;
%           for my $ct (sort keys $info->{content}->%*) {
            <%= elsif_chain("$name/$code/content-type") %>( $ct eq '<%= $ct %>' ) {
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
                if(     $self->validate_responses
                    and my $openapi = $self->openapi ) {
                    my $results = $openapi->validate_response($payload, { request => $tx->req });
                    if( $results->{error}) {
                        say $results;
                        say $tx->res->to_string;
                    };
                };
                $res->done(
% my $type = $info->{content}->{$ct}->{schema};
                    <%= include('inflated_response', { type => $type, prefix => $prefix, argname => '$payload' } ) %>
                );
            } else {
                # Unknown/unhandled content type
                $res->fail( sprintf("unknown_unhandled content type '%s'", $resp->content_type), $resp );
            }
%           }
%           } else { # we don't know how to handle this, so pass $res          # known content types?
            $res->done($resp);
%           }
% }
        } else {
            # An unknown/unhandled response, likely an error
            $res->fail( sprintf( "unknown_unhandled code %d: %s", $resp->code, $resp->body ), $resp);
        }
    })->retain;

    # Start our transaction
    $tx = $self->ua->start_p($tx)->then(sub($tx) {
        $r1->resolve( $tx );
        undef $r1;
    })->catch(sub($err) {
        $r1->fail( $err => $tx );
        undef $r1;
    });
__SYNCHRONOUS_RESPONSE__

$template{object} = <<'__OBJECT__';
% my @subclasses;
% my @included_types;
% if( exists $elt->{allOf}) {
%     for my $item ($elt->{allOf}->@*) {
%         if( $item->{name} ) {
%             push @subclasses, $item;
%         } else {
%             push @included_types, $item;
%         }
%     }
% } else {
%     push @included_types, $elt;
% }
%
package <%= $prefix %>::<%= $name %> <%= $version %>;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

use namespace::clean;

=encoding utf8

=head1 NAME

<%= $prefix %>::<%= $name %> -

=head1 SYNOPSIS

  my $obj = <%= $prefix %>::<%= $name %>->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

% if( @subclasses ) {
%     for my $item (@subclasses) {
extends '<%= $prefix %>::<%= $item->{name} %>';
%     }

% }
% if (@included_types) {
=head1 PROPERTIES

% for my $t (@included_types) {
%     for my $prop (sort keys $t->{properties}->%*) {
%         my $p = $t->{properties}->{$prop};
%         my $propname = property_name( $prop );
=head2 C<< <%= $propname %> >>

% if( $p->{description} and $p->{description} =~ /\S/ ) {
<%= $p->{description} =~ s/\s*$//r %>

% }
=cut

%# We need to guard against functions that Moo imports:
has '<%= $propname %>' => (
    is       => 'ro',
% if( exists $p->{enum} ) {
    isa      => Enum[
%     for my $val ($p->{enum}->@*) {
        "<%= $val %>",
%     }
    ],
% } else {
%     my $type = map_type( $p );
%     if( $type ) {
    isa      => <%= $type %>,
%     }
% };
% if( grep {$_ eq $prop} $elt->{required}->@*) {
    required => 1,
% }
);

%     }
% }
% } # included_types

1;
__OBJECT__

$template{oneOfObject} = <<'__FACTORYCLASS__';
% my @included_types;
% my ($type, $info) = resolve_schema($elt, $prefix);
% my @subclasses = openapi_dependencies( type => $elt, prefix => $prefix );
%
package <%= $prefix %>::<%= $name %> <%= $version %>;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use experimental 'signatures';
use stable 'postderef';
use Carp 'croak';

=encoding utf8

=head1 NAME

<%= $prefix %>::<%= $name %> - Factory class

=head1 SYNOPSIS

  my $obj = <%= $prefix %>::<%= $name %>->new($args);
  ...

This is a factory class that returns one of the following types
based on the C<< <%= $info->{discriminator} %> >> field:

% for my $v (sort keys $info->{mapping}->%* ) {
%    my $i = $info->{mapping}->{$v};
C<< <%= $v %> >> - L<< <%= class_type_name( $prefix, $i ) %> >>

% }

=cut

% if( @subclasses ) {
%     for my $item (@subclasses) {
use <%= $item %>;
%     }

% }

our %classes = (
% for my ($val) (sort keys $info->{mapping}->%*) {
%     my $impl = class_type_name( $prefix, $info->{mapping}->{$val} );
    '<%= $val %>' => '<%= $impl %>',
% }
);

sub new( $class, $data ) {
    if( ! exists $data->{ '<%= $info->{discriminator} %>' } ) {
        croak "Need a '<%= $info->{discriminator} %>' field";
    };
    my $type = $data->{ '<%= $info->{discriminator} %>' };
    croak "Unknown type '$type' in field '<%= $info->{discriminator} %>'"
        unless exists $classes{ $type };

    return $classes{ $type }->new( $data );
}

1;
__FACTORYCLASS__

$template{return_types} = <<'__RETURN_TYPES__';
% my %result_types;
% for my $code (sort keys $elt->{responses}->%*) {
%     my $status_type =   $code =~ /200/     ? 'on success'
%                       : $code =~ /30[12]/  ? 'on redirect'
%                       : $code =~ /400/     ? 'on error'
%                       : $code eq 'default' ? 'otherwise'
%                       :                      "on HTTP code $code"
%                       ;
%     my $info = $elt->{responses}->{ $code };
%        if( my $content = $info->{content} ) {
%            for my $ct (sort keys $content->%*) {
%                if( my $schema = $content->{$ct}->{schema}) {
%                    my $descriptor = 'a';
%                    my $class;
%                    my ($type,$class_info) = resolve_schema( $schema, $prefix );
%                    if( $type eq 'array' ) {
%                        $descriptor = 'an array of';
%                        $class = [join "::", $prefix, $schema->{items}->{name}];
%
%                    } elsif( $type eq 'class' ) {
%                        $class = [$class_info];
%
%                    } elsif( $type eq 'oneOf') {
%                        if( $class_info->{discriminator} ) {
%                            $descriptor = sprintf 'depending on C<< %s >> one of', $class_info->{discriminator};
%                            $class = [sort map { class_type_name($prefix, $_) } values $class_info->{mapping}->%*];
%
%                        } else {
%                            $descriptor = "We couldn't find a discriminator";
%                            $class = [""];
%                        }
%
%                    } elsif( $type eq 'object' ) {
%                        $class = [undef];
%
%                    } else {
%                        $class = [$content->{$ct}->{schema}->{type}];
%                    }
%                    $result_types{$status_type}->{$_} = 1
%                        for map { !defined($_)? q{Hashref}
%                                : $_          ? qq{$descriptor L<< $_ >>}
%                                :               "Unknown"
%                                } $class->@*;
%                }
%             }
%         }
%     }
% my %seen;
% for my $t ('on success', 'on error', 'on redirect', sort keys %result_types) {
%     next if $seen{ $t }++;
%     next unless exists $result_types{$t};
Returns <%= join ", ", sort keys $result_types{$t}->%* %> <%= $t %>.
% }
__RETURN_TYPES__

$template{ build_request } = <<'__BUILD_REQUEST__';
sub build_<%= $method->{name} %>_request( $self, %options ) {
<%= include( 'required_parameters', { elt => $elt }); =%>
%#
    my $method = '<%= uc $method->{http_method} %>';
%# Output the path parameters
% if( my $params = delete $parameters->{ path }) {
<%= include( 'path_parameters', { method => $method, params => $params }); =%>
% } else {
    my $path = '<%= $method->{path} %>';
% } # path parameters
    my $url = Mojo::URL->new( $self->server . $path );

%#------
%# Generate the (URL) parameters
%# This must happen before the remaining options are passed into an object
%# Output the query parameters
% if( my $params = delete $parameters->{ query }) {
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
% if( my $params = delete $parameters->{ header }) {                             # header parameters
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
% for (sort keys $parameters->%* ) {
%     for my $p ($parameters->{$_}->@*) {
    # unhandled <%= $p->{in} %> parameter <%= $p->{name} %>;
%     }
% }                         # parameter-in
%
% my $is_json;
% my $content_type;
% my $has_body = exists $elt->{requestBody};
% if( $has_body ) {
%#    We assume we will only ever have one content type for the request we send:
%     ($content_type) = sort keys $elt->{requestBody}->{content}->%*;
%     $is_json = $ct && $ct eq 'application/json';
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
% if( my $params = delete $parameters->{ header }) {                             # header parameters
%     for my $p ($params->@*) {
%         if( $p->{required} ) {
              '<%= $p->{name} %>' => delete $options{'<%= $p->{name} %>'},
%         } else {
        maybe '<%= $p->{name} %>' => delete $options{'<%= $p->{name} %>'},
%         }
%     }
% };                                                                           # header parameters
        }
% if( ! $has_body ) {
%# nothing to do
% } elsif( $is_json ) {
        => json => $request,
% } elsif( $content_type and $content_type eq 'multipart/form-data' ) {
        => form => $request,
% } elsif( $content_type and $content_type eq 'application/octet-stream' ) {
        => $body,
% } else {
        # XXX Need to fill the body
        # => $body,
% }
    );

    # validate our request while developing
    if(        $self->validate_requests
        and my $openapi = $self->openapi ) {
        my $results = $openapi->validate_request($tx->req);
        if( $results->{error}) {
            say $results;
            say $tx->req->to_string;
        };
    };

    return $tx
}
__BUILD_REQUEST__

$template{client_implementation} = <<'__CLIENT_IMPLEMENTATION__';
package <%= $prefix %>::<%= $name %> <%= $version %>;
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
use URI::Template;
use Mojo::JSON 'encode_json', 'decode_json';
use OpenAPI::Modern;

use Future::Mojo;
use Future::Queue;

our $SCHEMA_VERSION = "<%= $schema->{info}->{version} %>";

% my @submodules = openapi_submodules($schema);
% while (my($submodule,$info) = splice( @submodules, 0, 2 )) {
%     if( $info->{type} and $info->{type} eq 'object' ) {
use <%= $prefix %>::<%= $submodule %>;
%     }
% }

=encoding utf8

=head1 SYNOPSIS

  my $client = <%= $prefix %>::<%= $name %>->new(
      schema_file => '...',
  );

=head1 PROPERTIES

=head2 B<< schema_file >>

The OpenAPI schema file we use for validation

=head2 B<< schema >>

The OpenAPI schema data structure we use for validation. If not given,
we will create one using the C<schema_file> parameter.

=head2 B<< openapi >>

The L<OpenAPI::Modern> object we use for validation. If not given,
we will create one using the C<schema> parameter.

=head2 B<< ua >>

The L<Mojo::UserAgent> to use

=head2 B<< server >>

The server to access

=cut

has 'schema_file' => (
    is => 'ro',
);

has 'schema' => (
    is => 'lazy',
    default => sub {
        if( my $fn = $_[0]->schema_file ) {
            YAML::PP->new( boolean => 'JSON::PP' )->load_file( $fn );
        }
    },
);

has 'validate_requests' => (
    is => 'rw',
    default => 1,
);

has 'validate_responses' => (
    is => 'rw',
    default => 1,
);

has 'openapi' => (
    is => 'lazy',
    default => sub {
        if( my $schema = $_[0]->schema ) {
            OpenAPI::Modern->new( openapi_schema => $schema, openapi_uri => '' )
        }
    },
);

# The HTTP stuff should go into a ::Role I guess
has 'ua' => (
    is => 'lazy',
    default => sub { Mojo::UserAgent->new },
);

has 'server' => (
% if ( my $server = $schema->{servers}->[0] ) {
    is => 'lazy',
    default => sub { '<%= $schema->{servers}->[0]->{url} %>' },
% } else {
    is => 'ro',
% }
);

=head1 METHODS

% for my $method ($methods->@*) {
% my $elt = $method->{elt};
% my $parameters = $elt->{parameters};
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
=head2 C<< build_<%= $method->{name} %>_request >>

Build an HTTP request as L<Mojo::Request> object. For the parameters see below.

=head2 C<< <%= $method->{name} %> >>

%# Generate the example invocation
% if( $is_streaming ) {
  use Future::Utils 'repeat';
  my $response = $client-><%= $method->{name} %>();
  my $streamed = $response->get();
  repeat {
      my ($res) = $streamed->shift;
      if( $res ) {
          my $str = $res->get;
          say $str;
      }

      Future::Mojo->done( defined $res );
  } until => sub($done) { $done->get };
% } else {
%     if( $parameters and $parameters->@* ) {
%         my $required = $elt->{required} // [];
%         my %seen;
  my $res = $client-><%= $method->{name} %>(
%         for my $p ($required->@*) {
      '<%= $p->{name} %>' => '<%= $p->{default} // '...' %>', # required
%             $seen{ $p->{name} } = 1;
%         }
%         for my $p ($parameters->@*) {
%             next if $seen{ $p->{name} };
      '<%= $p->{name} %>' => '<%= $p->{default} // '...' %>',
%         }
  )->get;
%     } else {
  my $res = $client-><%= $method->{name} %>()->get;
%     }
% }

% if(     $elt->{responses}->{200}
%     and $elt->{responses}->{200}->{content}
%     and $elt->{responses}->{200}->{content}->{"application/json"}
%     and $elt->{responses}->{200}->{content}->{"application/json"}->{example} ) {
%         my $pretty = Cpanel::JSON::XS->new->ascii->pretty->allow_nonref;
%         my $ex = $elt->{responses}->{200}->{content}->{"application/json"}->{example};
%         use feature 'try';
%         my $str;
%         try { $str=$pretty->encode($pretty->decode( $ex )) } catch($e) { $str = $ex }
<%= perl_comment( '  ', $str ) %>
% }
%
%# pretty-print the JSON response?
% if( $elt->{summary}  and $elt->{summary} =~ /\S/ ) {
<%= markdown_to_pod( $elt->{summary} =~ s/\s*$//r ) %>

%}
%# List/add the invocation parameters
% if( $parameters ) { # parameters
=head3 Parameters

=over 4

%     for my $p ($parameters->@* ) {
=item B<< <%= $p->{name} %> >>

%     if( $p->{description} =~ /\S/ ) {
<%= markdown_to_pod( $p->{description} =~ s/\s*$//r ) %>

%     }
%     if( $p->{default}) {
Defaults to C<< <%= $p->{default} =%> >>

%         }
%     }
=back

% } # parameters
%#
%# Add the body/schema parameters:
% (my $ct) = exists $elt->{requestBody} ? keys $elt->{requestBody}->{content}->%* : ();
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
=item C<< <%= property_name( $prop ) %> >>

% if( $p->{description} ) {
<%= markdown_to_pod( $p->{description} =~ s/\s*$//r ) %>

% }
%         }
=back
%     }
% }

%=include('return_types', { prefix => $prefix, elt => $elt });
=cut

<%= include( 'build_request', { method => $method, parameters => \%parameters, elt => $elt, ct => $ct, prefix => $prefix, } ); %>

sub <%= $method->{name} %>( $self, %options ) {
    my $tx = $self->_build_<%= $method->{name} %>_request(%options);

%# We want to handle both here, streaming (ndjson) and plain responses
%# Plain responses are easy, but for streamed, we want to register an ->on('progress')
%# handler instead of the plain part completely. In the ->on('progress') part,
%# we still run the handler, so maybe that is the same ?!

    my $res = Future::Mojo->new();

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
__CLIENT_IMPLEMENTATION__

$template{client} = <<'__CLIENT__';
package <%= $prefix %>::<%= $name %> <%= $version %>;
use 5.020;
use Moo 2;
use experimental 'signatures';

extends '<%= $prefix %>::<%= $name %>::Impl';

=encoding utf8

=head1 NAME

<%= $prefix %>::<%= $name %> - Client for <%= $prefix %>

=head1 SYNOPSIS

  use 5.020;
  use <%= $prefix %>::<%= $name %>;

  my $client = <%= $prefix %>::<%= $name %>->new(
      schema_file => '...',
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
%=include('return_types', { prefix => $prefix, elt => $elt });
=cut

% }
1;
__CLIENT__

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
