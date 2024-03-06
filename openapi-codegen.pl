package main;
use 5.036;
use experimental 'signatures';
use experimental 'for_list';
use File::Path 'make_path';
use File::Basename;
use Getopt::Long;
use Mojo::Template;
use JSON::Pointer;
use YAML::PP;

=head1 NAME

openapi-codegen.pl - create and maintain (client) libraries from OpenAPI / Swagger spec

=cut

GetOptions(
    'package|p=s' => \my $package,
    'force|f' => \my $force,
);
$package //= 'AI::Ollama';

my $schema = YAML::PP->new( boolean => 'JSON::PP' )->load_file( 'ollama/ollama-curated.yaml' );

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

sub update_file( %options ) {
    my $filename = delete $options{ filename }
        or die "Need a filename to create/update";
    my $new_content = delete $options{ content };
    my $keep_existing = $options{ keep_existing };
    my $encoding = $options{ encoding } // ':raw:encoding(UTF-8)';

    my $content;
    if( -f $filename ) {
        return if $keep_existing and not $force;

        open my $fh, "<$encoding", $filename
            or die "Couldn't read '$filename': $!";
        local $/;
        $content = <$fh>;
    };

    if( $content ne $new_content ) {
        make_path( dirname $filename ); # just to be sure
        if( open my $fh, ">$encoding", $filename ) {
            print $fh $new_content;
        } else {
            warn "Couldn't (re)write '$filename': $!";
        };
    };
}

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
    } elsif( $typemap{ $type }) {
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

my %template;
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

% for my $prop (sort keys $elt->{properties}->%*) {
%     my $p = $elt->{properties}->{$prop};
=head2 C<< <%= $prop %> >>

<%= $p->{description} =~ s/\s*$//r %>

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

# These should go into a ::Role
use YAML::PP;
use Mojo::UserAgent;
use Mojo::JSON 'encode_json', 'decode_json';
use OpenAPI::Modern;

use Future::Mojo;

% for my ($submodule,$info) (openapi_submodules($schema)) {
%     if( $info->{type} eq 'object' ) {
use <%= $prefix %>::<%= $submodule %>;
%     }
% }

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

% for my $method ($methods->@*) {
% my $elt = $method->{elt};
=head2 C<< <%= $method->{name} %> >>

  my $res = $client-><%= $method->{name} %>()->get;

<%= $elt->{summary} =~ s/\s*$//r %>

%# Add the parameters:
% (my $ct) = keys $elt->{requestBody}->{content}->%*;
% my $type = $elt->{requestBody}->{content}->{$ct}->{schema};
% if( $type ) {

=head3 Options

%     for my $prop (sort keys $type->{properties}->%*) {
%         my $p = $type->{properties}->{$prop};
=over 4

= C<< <%= $prop %> >>

% if( $p->{description} ) {
<%= $p->{description} =~ s/\s*$//r %>

% }
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

    my $method = '<%= uc $method->{http_method} %>';
    my $url = $self->server . '<%= $method->{path} %>';

% my $is_json;
% my $content_type;
% if( $elt->{requestBody} ) {
%     my $content = $elt->{requestBody}->{content};
%     for my $ct (sort keys $content->%*) {
%         $content_type = $ct; # will we have more than one?!
%         if( $content->{$ct}->{schema}) {
    my $request = <%= $prefix %>::<%= $content->{$ct}->{schema}->{name} %>->new( \%options );
    # resp. validate %options against <%= $content->{$ct}->{schema}->{name} %>
    # send as <%= $ct %>
%             $is_json = $ct eq 'application/json';
%         } else {
              # don't know how to handle this ...
%         }
%     }
% }
    my $tx = $self->ua->build_tx(
        $method => $url,
        {
            "Content-Type" => '<%= $content_type %>',
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
    say $results;
    say $tx->req->to_string;

    # We need to start $tx here and then append us to the promise?!

%# We want to handle both here, streaming (ndjson) and plain responses
%# Plain responses are easy, but for streamed, we want to register an ->on('progress')
%# handler instead of the plain part completely. In the ->on('progress') part,
%# we still run the handler, so maybe that is the same ?!
% my $is_streaming =    exists $elt->{responses}->{200}
%                    && $elt->{responses}->{200}->{content}
%                    && [keys $elt->{responses}->{200}->{content}->%*]->[0] eq 'application/x-ndjson'
%                    ;

    my $r1 = Future::Mojo->new();
% if( $is_streaming ) {
    use Future::Queue;
    my $queue = Future::Queue->new;
    my $res = $queue->head;
    our @store; # we should use ->retain() instead
    push @store, $r1->then( sub( $tx ) {
% } else {
    my $res = $r1->then( sub( $tx ) {
% }
        my $resp = $tx->res;
        # Should we validate using OpenAPI::Modern here?!
%# Should this be its own subroutine instead?!
% for my $code (sort keys $elt->{responses}->%*) {
%     my $info = $elt->{responses}->{ $code };
%# XXX support 2xx / 5xx codes through =~
%# XXX if streaming, we need to handle a non-streaming error response!
        if( $resp->code == <%= $code %> ) {
            # <%= $info->{description} %>
%       # Check the content type
%       # Will we always have a content type?!
%       if( $info->{content} ) {
%           for my $ct (sort keys $info->{content}->%*) {
            my $ct = $resp->headers->content_type;
% if( $is_streaming ) {
            return unless $ct;
% }
            $ct =~ s/;\s+.*//;
%               if( $is_streaming ) {
            if( $ct eq '<%= $ct %>' ) {
                # we only handle ndjson currently
    my $leftover = '';
                    my $fresh = $leftover . substr( $msg->body, $offset );
                $resp->on(progress => sub($msg,@) {
                    my @lines = split /\n/, $fresh;
                    $leftover = pop @lines; # an empty string
                    for (@lines) {
                        my $payload = decode_json( $_ );
                        $queue->enqueue(
%               if( my $restype = $info->{content}->{$ct}->{schema}) {
                            <%= $prefix %>::<%= $restype->{name} %>->new($payload),
%               } else {
                            $payload
%               }
                        );
                    };
                    if( $msg->{state} eq 'finished' ) {
                        $queue->enqueue( undef );
                    }
                });
%               } else {
            if( $ct eq '<%= $ct %>' ) {
%# These handlers for content types should come from templates? Or maybe
%# from a subroutine?!
%               if( $ct eq 'application/json' ) {
                my $payload = $resp->json();
%               } elsif( $ct eq 'application/x-ndjson' ) {
                # code missing to hack up ndjson into hashes
                my $payload = $resp->body();
%               } else {
                my $payload = $resp->body();
%               }
%               if( my $restype = $info->{content}->{$ct}->{schema}) {
                return Future::Mojo->done(
                    <%= $prefix %>::<%= $restype->{name} %>->new($payload),
                );
%               } else {
                return Future::Mojo->done( $payload );
%               }
%               }
            }
%           }
%       } else { # we don't know how to handle this, so pass $res
            return Future::Mojo->done($resp);
%       }
        }
% }
    });

% if( $is_streaming ) {
    $tx->res->once( progress => sub($msg, @) {
        $r1->resolve( $tx );
        undef $r1;
    });
    $tx = $self->ua->start($tx);
% } else {
    # Start our transaction
    $tx = $self->ua->start_p($tx)->then(sub($tx) {
        $r1->resolve( $tx );
        undef $r1;
    });
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

<%= $elt->{summary} =~ s/\s*$//r; %>

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

my $mt = Mojo::Template->new->vars(1)->namespace('main');

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

    if( ! exists $template{ $type}) {
        warn "No template for type '$type' ($name)";
    }
    my $template = $template{ $type };


    my $filename = filename( $name );
    update_file(
        filename => $filename,
        content  => $mt->render( $template, \%info )
    );
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

# Generate ::Client::Impl
update_file( filename => filename('Client::Impl'),
             content => $mt->render($template{client_implementation},
             {
                methods => \@methods,
                name => 'Client::Impl',
                schema => $schema,
                %options
              }));

# If it does not exist, generate the stub for the main file ::Client as well
# The client consists of "use parent '::Client::Impl';
# and the pod for all the methods, for manual editing.
update_file( filename => filename('Client'),
             keep_existing => 1,
             content => $mt->render($template{client},
             {
                methods => \@methods,
                name => 'Client',
                schema => $schema,
                %options
              }));

=head1 SEE ALSO

The OpenAPI spec - L<https://spec.openapis.org/oas/v3.1.0#openapi-document>

__END__
[ ] Move common parts of POD generation into a subroutine / include()-able
    template
[ ] (optionally) check that the created module file(s) compile
[ ] Split out the templates into separate files
[ ] Properly handle URI templates
