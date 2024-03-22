package Speech::Recognition::Whisper::Client::Impl 0.01;
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

use Speech::Recognition::Whisper::Error;
use Speech::Recognition::Whisper::LoadModel;
use Speech::Recognition::Whisper::SuccessfulLoad;
use Speech::Recognition::Whisper::TranscribeFile;
use Speech::Recognition::Whisper::Transcription;

=head1 SYNOPSIS

=head1 PROPERTIES

=head2 B<< openapi >>

=head2 B<< ua >>

=head2 B<< server >>

=cut

# XXX this should be more configurable, and potentially you don't want validation?!
has 'schema' => (
    is => 'lazy',
    default => sub {
        YAML::PP->new( boolean => 'JSON::PP' )->load_file( 'ollama/ollama-curated.yaml' );
    },
);

has 'openapi' => (
    is => 'lazy',
    default => sub { OpenAPI::Modern->new( openapi_schema => $_[0]->schema, openapi_uri => '/api' )},
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

=head2 C<< inference >>

  my $res = $client->inference()->get;

Perform inference on a WAV file


=head3 Options

=over 4

=item C<< name >>

=item C<< response_format >>

=item C<< temperature >>

Temperature

=item C<< temperature_inc >>

=back

Returns a L<< Speech::Recognition::Whisper::Transcription >>.
Returns a L<< Speech::Recognition::Whisper::Error >>.

=cut

sub inference( $self, %options ) {
    my $method = 'POST';
    my $path = '/inference';
    my $url = Mojo::URL->new( $self->server . $path );

    my $request = Speech::Recognition::Whisper::TranscribeFile->new( \%options );
    my $tx = $self->ua->build_tx(
        $method => $url,
        {
            'Accept' => 'application/json',
            "Content-Type" => 'multipart/form-data',
        }
        => form => $request->as_hash,
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
            # Successful response
            my $ct = $resp->headers->content_type;
            $ct =~ s/;\s+.*//;
            if( $ct eq 'application/json' ) {
                my $payload = $resp->json();
                return Future::Mojo->done(
                    Speech::Recognition::Whisper::Transcription->new($payload),

                );
            }
        } elsif( $resp->code  ) {
            # Error response
            my $ct = $resp->headers->content_type;
            $ct =~ s/;\s+.*//;
            if( $ct eq 'application/json' ) {
                my $payload = $resp->json();
                return Future::Mojo->done(
                    Speech::Recognition::Whisper::Error->new($payload),

                );
            }
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

    return $res
}

=head2 C<< load >>

  my $res = $client->load()->get;

Load a model


=head3 Options

=over 4

=item C<< model >>

Model file

=item C<< response_format >>

Format of the response

=item C<< temperature >>

Temperature

=item C<< temperature_inc >>

=back

Returns a L<< Speech::Recognition::Whisper::SuccessfulLoad >>.
Returns a L<< Speech::Recognition::Whisper::Error >>.

=cut

sub load( $self, %options ) {
    my $method = 'POST';
    my $path = '/load';
    my $url = Mojo::URL->new( $self->server . $path );

    my $request = Speech::Recognition::Whisper::LoadModel->new( \%options );
    my $tx = $self->ua->build_tx(
        $method => $url,
        {
            'Accept' => 'application/json,application/text',
            "Content-Type" => 'multipart/form-data',
        }
        => form => $request->as_hash,
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
            # Successful response
            my $ct = $resp->headers->content_type;
            $ct =~ s/;\s+.*//;
            if( $ct eq 'application/text' ) {
                my $payload = $resp->body();
                return Future::Mojo->done(
                    Speech::Recognition::Whisper::SuccessfulLoad->new($payload),

                );
            }
        } elsif( $resp->code  ) {
            # Error response
            my $ct = $resp->headers->content_type;
            $ct =~ s/;\s+.*//;
            if( $ct eq 'application/json' ) {
                my $payload = $resp->json();
                return Future::Mojo->done(
                    Speech::Recognition::Whisper::Error->new($payload),

                );
            }
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

    return $res
}


1;
