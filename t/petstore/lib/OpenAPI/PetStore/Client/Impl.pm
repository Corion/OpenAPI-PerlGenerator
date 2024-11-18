package OpenAPI::PetStore::Client::Impl 0.01;
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

our $SCHEMA_VERSION = "1.0.0";

use OpenAPI::PetStore::Error;
use OpenAPI::PetStore::NewPet;

=encoding utf8

=head1 SYNOPSIS

=head1 PROPERTIES

=head2 B<< openapi >>

The L<OpenAPI::Modern> object we use for validation

=head2 B<< ua >>

The L<Mojo::UserAgent> to use

=head2 B<< server >>

The server to access

=cut

# XXX this should be more configurable, and potentially you don't want validation?!

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

has 'openapi' => (
    is => 'lazy',
    default => sub { OpenAPI::Modern->new( openapi_schema => $_[0]->schema, openapi_uri => '' )},
);

# The HTTP stuff should go into a ::Role I guess
has 'ua' => (
    is => 'lazy',
    default => sub { Mojo::UserAgent->new },
);

has 'server' => (
    is => 'lazy',
    default => sub { 'https://petstore.swagger.io/v2' },
);

=head1 METHODS

=head2 C<< findPets >>

  my $res = $client->findPets()->get;

=head3 Parameters

=over 4

=item B<< tags >>

tags to filter by

=item B<< limit >>

maximum number of results to return

=back


Returns an array of L<< OpenAPI::PetStore::Pet >> on success.
Returns a L<< OpenAPI::PetStore::Error >> on HTTP code default.

=cut

sub _build_findPets_request( $self, %options ) {
    my $method = 'GET';
    my $path = '/pets';
    my $url = Mojo::URL->new( $self->server . $path );

    $url->query->merge(
        maybe 'tags' => delete $options{'tags'},
        maybe 'limit' => delete $options{'limit'},
    );

    my $tx = $self->ua->build_tx(
        $method => $url,
        {
            'Accept' => 'application/json',
        }
    );

    return $tx
}


sub findPets( $self, %options ) {
    my $tx = $self->_build_findPets_request(%options);

    # validate our request while developing
    if( my $openapi = $self->openapi ) {
        my $results = $openapi->validate_request($tx->req);
        if( $results->{error}) {
            say $results;
            say $tx->req->to_string;
        };
    };


    my $res = Future::Mojo->new();

    my $r1 = Future::Mojo->new();
    $r1->then( sub( $tx ) {
        my $resp = $tx->res;
        # Should we validate using OpenAPI::Modern here?!
        if( $resp->code == 200 ) {
            # pet response
            my $ct = $resp->headers->content_type;
            $ct =~ s/;\s+.*//;
            if( $ct eq 'application/json' ) {
                my $payload = $resp->json();
                $res->done(
                    [ map { OpenAPI::PetStore::Pet->new($_),
 } $payload->@* ],

                );
            } else {
                # Unknown/unhandled content type
                $res->fail( $resp );
            }
        } elsif( $resp->code  ) {
            # unexpected error
            my $ct = $resp->headers->content_type;
            $ct =~ s/;\s+.*//;
            if( $ct eq 'application/json' ) {
                my $payload = $resp->json();
                $res->done(
                    OpenAPI::PetStore::Error->new($payload),

                );
            } else {
                # Unknown/unhandled content type
                $res->fail( $resp );
            }
        } else {
            # An unknown/unhandled response, likely an error
            $res->fail($resp);
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

    return $res
}

=head2 C<< addPet >>

  my $res = $client->addPet()->get;


=head3 Options

=over 4

=item C<< name >>

=item C<< tag >>

=back

Returns a L<< OpenAPI::PetStore::Pet >> on success.
Returns a L<< OpenAPI::PetStore::Error >> on HTTP code default.

=cut

sub _build_addPet_request( $self, %options ) {
    my $method = 'POST';
    my $path = '/pets';
    my $url = Mojo::URL->new( $self->server . $path );

    my $request = OpenAPI::PetStore::NewPet->new( \%options );
    my $tx = $self->ua->build_tx(
        $method => $url,
        {
            'Accept' => 'application/json',
            "Content-Type" => 'application/json',
        }
        => json => $request->as_hash,
    );

    return $tx
}


sub addPet( $self, %options ) {
    my $tx = $self->_build_addPet_request(%options);

    # validate our request while developing
    if( my $openapi = $self->openapi ) {
        my $results = $openapi->validate_request($tx->req);
        if( $results->{error}) {
            say $results;
            say $tx->req->to_string;
        };
    };


    my $res = Future::Mojo->new();

    my $r1 = Future::Mojo->new();
    $r1->then( sub( $tx ) {
        my $resp = $tx->res;
        # Should we validate using OpenAPI::Modern here?!
        if( $resp->code == 200 ) {
            # pet response
            my $ct = $resp->headers->content_type;
            $ct =~ s/;\s+.*//;
            if( $ct eq 'application/json' ) {
                my $payload = $resp->json();
                $res->done(
                    OpenAPI::PetStore::Pet->new($payload),

                );
            } else {
                # Unknown/unhandled content type
                $res->fail( $resp );
            }
        } elsif( $resp->code  ) {
            # unexpected error
            my $ct = $resp->headers->content_type;
            $ct =~ s/;\s+.*//;
            if( $ct eq 'application/json' ) {
                my $payload = $resp->json();
                $res->done(
                    OpenAPI::PetStore::Error->new($payload),

                );
            } else {
                # Unknown/unhandled content type
                $res->fail( $resp );
            }
        } else {
            # An unknown/unhandled response, likely an error
            $res->fail($resp);
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

    return $res
}

=head2 C<< deletePet >>

  my $res = $client->deletePet()->get;

=head3 Parameters

=over 4

=item B<< id >>

ID of pet to delete

=back


Returns a L<< OpenAPI::PetStore::Error >> on HTTP code default.

=cut

sub _build_deletePet_request( $self, %options ) {
    croak "Missing required parameter 'id'"
        unless exists $options{ 'id' };

    my $method = 'DELETE';
    my $template = URI::Template->new( '/pets/{id}' );
    my $path = $template->process(
              'id' => delete $options{'id'},
    );
    my $url = Mojo::URL->new( $self->server . $path );

    my $tx = $self->ua->build_tx(
        $method => $url,
        {
            'Accept' => 'application/json',
        }
    );

    return $tx
}


sub deletePet( $self, %options ) {
    my $tx = $self->_build_deletePet_request(%options);

    # validate our request while developing
    if( my $openapi = $self->openapi ) {
        my $results = $openapi->validate_request($tx->req);
        if( $results->{error}) {
            say $results;
            say $tx->req->to_string;
        };
    };


    my $res = Future::Mojo->new();

    my $r1 = Future::Mojo->new();
    $r1->then( sub( $tx ) {
        my $resp = $tx->res;
        # Should we validate using OpenAPI::Modern here?!
        if( $resp->code == 204 ) {
            # pet deleted
            $res->done($resp);
        } elsif( $resp->code  ) {
            # unexpected error
            my $ct = $resp->headers->content_type;
            $ct =~ s/;\s+.*//;
            if( $ct eq 'application/json' ) {
                my $payload = $resp->json();
                $res->done(
                    OpenAPI::PetStore::Error->new($payload),

                );
            } else {
                # Unknown/unhandled content type
                $res->fail( $resp );
            }
        } else {
            # An unknown/unhandled response, likely an error
            $res->fail($resp);
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

    return $res
}

=head2 C<< find_pet_by_id >>

  my $res = $client->find_pet_by_id()->get;

=head3 Parameters

=over 4

=item B<< id >>

ID of pet to fetch

=back


Returns a L<< OpenAPI::PetStore::Pet >> on success.
Returns a L<< OpenAPI::PetStore::Error >> on HTTP code default.

=cut

sub _build_find_pet_by_id_request( $self, %options ) {
    croak "Missing required parameter 'id'"
        unless exists $options{ 'id' };

    my $method = 'GET';
    my $template = URI::Template->new( '/pets/{id}' );
    my $path = $template->process(
              'id' => delete $options{'id'},
    );
    my $url = Mojo::URL->new( $self->server . $path );

    my $tx = $self->ua->build_tx(
        $method => $url,
        {
            'Accept' => 'application/json',
        }
    );

    return $tx
}


sub find_pet_by_id( $self, %options ) {
    my $tx = $self->_build_find_pet_by_id_request(%options);

    # validate our request while developing
    if( my $openapi = $self->openapi ) {
        my $results = $openapi->validate_request($tx->req);
        if( $results->{error}) {
            say $results;
            say $tx->req->to_string;
        };
    };


    my $res = Future::Mojo->new();

    my $r1 = Future::Mojo->new();
    $r1->then( sub( $tx ) {
        my $resp = $tx->res;
        # Should we validate using OpenAPI::Modern here?!
        if( $resp->code == 200 ) {
            # pet response
            my $ct = $resp->headers->content_type;
            $ct =~ s/;\s+.*//;
            if( $ct eq 'application/json' ) {
                my $payload = $resp->json();
                $res->done(
                    OpenAPI::PetStore::Pet->new($payload),

                );
            } else {
                # Unknown/unhandled content type
                $res->fail( $resp );
            }
        } elsif( $resp->code  ) {
            # unexpected error
            my $ct = $resp->headers->content_type;
            $ct =~ s/;\s+.*//;
            if( $ct eq 'application/json' ) {
                my $payload = $resp->json();
                $res->done(
                    OpenAPI::PetStore::Error->new($payload),

                );
            } else {
                # Unknown/unhandled content type
                $res->fail( $resp );
            }
        } else {
            # An unknown/unhandled response, likely an error
            $res->fail($resp);
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

    return $res
}


1;
