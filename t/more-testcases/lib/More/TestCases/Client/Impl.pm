package More::TestCases::Client::Impl 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use PerlX::Maybe;

# These should go into a ::Role
use YAML::PP;
use Mojo::UserAgent;
use Mojo::URL;
use Mojo::JSON 'encode_json', 'decode_json';
use OpenAPI::Modern;

use Future::Mojo;


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

=head2 C<< withCookie >>

  my $res = $client->withCookie()->get;

=head3 Parameters

=item B<< session-id >>

token to be passed as a header

=cut



=cut

sub withCookie( $self, %options ) {
    croak "Missing required parameter 'session-id'
        unless exists $options{ 'session-id' };

    my $method = 'GET';
    my $path = '/with-cookie';
    my $url = Mojo::URL->new( $self->server . $path );

    # unhandled cookie parameter session-id;
    my $tx = $self->ua->build_tx(
        $method => $url,
        {
        }
        # XXX Need to fill the body
        # => $body,
    );

    # validate our request while developing
    my $results = $self->openapi->validate_request($tx->req);
    if( $results->{error}) {
        say $results;
        say $tx->req->to_string;
    };


    my $r1 = Future::Mojo->new();
    my $res = $r1->then( sub( $tx ) {
        my $resp = $tx->res;
        # Should we validate using OpenAPI::Modern here?!
        if( $resp->code == 200 ) {
            # pet response
            return Future::Mojo->done($resp);
        } else {
            # unexpected error
            return Future::Mojo->done($resp);
        }
    });

    # Start our transaction
    $tx = $self->ua->start_p($tx)->then(sub($tx) {
        $r1->resolve( $tx );
        undef $r1;
    });

    return $res
}

=head2 C<< withHeader >>

  my $res = $client->withHeader()->get;

=head3 Parameters

=item B<< X-token >>

token to be passed as a header

=cut



=cut

sub withHeader( $self, %options ) {
    croak "Missing required parameter 'X-token'
        unless exists $options{ 'X-token' };

    my $method = 'GET';
    my $path = '/with-header';
    my $url = Mojo::URL->new( $self->server . $path );

    my $tx = $self->ua->build_tx(
        $method => $url,
        {
                   'X-token' => delete $options{'X-token'}
        }
        # XXX Need to fill the body
        # => $body,
    );

    # validate our request while developing
    my $results = $self->openapi->validate_request($tx->req);
    if( $results->{error}) {
        say $results;
        say $tx->req->to_string;
    };


    my $r1 = Future::Mojo->new();
    my $res = $r1->then( sub( $tx ) {
        my $resp = $tx->res;
        # Should we validate using OpenAPI::Modern here?!
        if( $resp->code == 200 ) {
            # pet response
            return Future::Mojo->done($resp);
        } elsif( $resp->code =~ /4../ ) {
            # authentication error
            return Future::Mojo->done($resp);
        } else {
            # unexpected error
            return Future::Mojo->done($resp);
        }
    });

    # Start our transaction
    $tx = $self->ua->start_p($tx)->then(sub($tx) {
        $r1->resolve( $tx );
        undef $r1;
    });

    return $res
}


1;
