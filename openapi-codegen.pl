package main;
use 5.020;
use experimental 'signatures';
use File::Path 'make_path';
use File::Basename;
use Getopt::Long;
use Mojo::Template;
use JSON::Pointer;
use YAML::PP;

GetOptions(
    'package|p=s' => \my $package,
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
        return if $keep_existing;

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

my %template;
$template{object} = <<'__OBJECT__';
package <%= $prefix %>::<%= $name %> 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';

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
#   isa      => '<%= $p->{type} %>',
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
use OpenAPI::Modern;

% for my $submodule (sort keys $schema->{components}->{schemas}->%*) {
%     my $info = $schema->{components}->{schemas}->{$submodule};
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

<%= $elt->{summary} =~ s/\s*$//r %>

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
    my $res = $self->ua->start_p($tx)->then(sub($tx) {
        my $res = $tx->res;

%# Should this be its own subroutine instead?!
% for my $code (sort keys $elt->{responses}->%*) {
%     my $info = $elt->{responses}->{ $code };
        if( $res->code == <%= $code %> ) {
            # <%= $info->{description} %>
%       # Check the content type
%       # Will we always have a content type?!
%       if( $info->{content} ) {
%           for my $ct (sort $info->{content}->%*) {
            if( $res->content_type eq '<%= $ct %>' ) {
            }
%           }
%       } else { # we don't know how to handle this, so pass $res
            return $res;
%       }
        }
% }
    }

    return $res
}

% }

1;
__CLIENT__

my $mt = Mojo::Template->new->vars(1);

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
