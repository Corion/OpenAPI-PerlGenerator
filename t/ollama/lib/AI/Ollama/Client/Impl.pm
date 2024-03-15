package AI::Ollama::Client::Impl 0.01;
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

use AI::Ollama::CopyModelRequest;
use AI::Ollama::CreateModelRequest;
use AI::Ollama::CreateModelResponse;
use AI::Ollama::DeleteModelRequest;
use AI::Ollama::GenerateChatCompletionRequest;
use AI::Ollama::GenerateChatCompletionResponse;
use AI::Ollama::GenerateCompletionRequest;
use AI::Ollama::GenerateCompletionResponse;
use AI::Ollama::GenerateEmbeddingRequest;
use AI::Ollama::GenerateEmbeddingResponse;
use AI::Ollama::Message;
use AI::Ollama::Model;
use AI::Ollama::ModelInfo;
use AI::Ollama::ModelInfoRequest;
use AI::Ollama::ModelsResponse;
use AI::Ollama::PullModelRequest;
use AI::Ollama::PullModelResponse;
use AI::Ollama::PushModelRequest;
use AI::Ollama::PushModelResponse;
use AI::Ollama::RequestOptions;

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

=head2 C<< checkBlob >>

  my $res = $client->checkBlob()->get;

Check to see if a blob exists on the Ollama server which is useful when creating models.

=head3 Parameters

=over 4

=item B<< digest >>

the SHA256 digest of the blob

=back



=cut

sub checkBlob( $self, %options ) {
    croak "Missing required parameter 'digest'"
        unless exists $options{ 'digest' };

    my $method = 'HEAD';
    my $template = URI::Template->new( '/blobs/{digest}' );
    my $path = $template->process(
              'digest' => delete $options{'digest'},
    );
    my $url = Mojo::URL->new( $self->server . $path );

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
            # Blob exists on the server
            return Future::Mojo->done($resp);
        } elsif( $resp->code == 404 ) {
            # Blob was not found
            return Future::Mojo->done($resp);
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

=head2 C<< createBlob >>

  my $res = $client->createBlob()->get;

Create a blob from a file. Returns the server file path.

=head3 Parameters

=over 4

=item B<< digest >>

the SHA256 digest of the blob

=back



=cut

sub createBlob( $self, %options ) {
    croak "Missing required parameter 'digest'"
        unless exists $options{ 'digest' };

    my $method = 'POST';
    my $template = URI::Template->new( '/blobs/{digest}' );
    my $path = $template->process(
              'digest' => delete $options{'digest'},
    );
    my $url = Mojo::URL->new( $self->server . $path );

    my $request = AI::Ollama::->new( \%options );
    my $tx = $self->ua->build_tx(
        $method => $url,
        {
            "Content-Type" => 'application/octet-stream',
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
        if( $resp->code == 201 ) {
            # Blob was successfully created
            return Future::Mojo->done($resp);
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

=head2 C<< generateChatCompletion >>

  use Future::Utils 'repeat';
  my $responses = $client->generateChatCompletion();
  repeat {
      my ($res) = $responses->shift;
      if( $res ) {
          my $str = $res->get;
          say $str;
      }

      Future::Mojo->done( defined $res );
  } until => sub($done) { $done->get };

Generate the next message in a chat with a provided model.


=head3 Options

=over 4

=item C<< format >>

The format to return a response in. Currently the only accepted value is json.

Enable JSON mode by setting the format parameter to json. This will structure the response as valid JSON.

Note: it's important to instruct the model to use JSON in the prompt. Otherwise, the model may generate large amounts whitespace.

=item C<< keep_alive >>

How long (in minutes) to keep the model loaded in memory.

- If set to a positive duration (e.g. 20), the model will stay loaded for the provided duration.
- If set to a negative duration (e.g. -1), the model will stay loaded indefinitely.
- If set to 0, the model will be unloaded immediately once finished.
- If not set, the model will stay loaded for 5 minutes by default

=item C<< messages >>

The messages of the chat, this can be used to keep a chat memory

=item C<< model >>

The model name.

Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.

=item C<< options >>

Additional model parameters listed in the documentation for the Modelfile such as `temperature`.

=item C<< stream >>

If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.

=back

Returns a L<< AI::Ollama::GenerateChatCompletionResponse >>.

=cut

sub generateChatCompletion( $self, %options ) {
    my $method = 'POST';
    my $path = '/chat';
    my $url = Mojo::URL->new( $self->server . $path );

    my $request = AI::Ollama::GenerateChatCompletionRequest->new( \%options );
    my $tx = $self->ua->build_tx(
        $method => $url,
        {
            'Accept' => 'application/x-ndjson',
            "Content-Type" => 'application/json',
        }
        => json => $request->as_hash,
    );

    # validate our request while developing
    my $results = $self->openapi->validate_request($tx->req);
    if( $results->{error}) {
        say $results;
        say $tx->req->to_string;
    };


    my $r1 = Future::Mojo->new();
    use Future::Queue;
    my $res = Future::Queue->new( prototype => 'Future::Mojo' );
    our @store; # we should use ->retain() instead
    push @store, $r1->then( sub( $tx ) {
        my $resp = $tx->res;
        # Should we validate using OpenAPI::Modern here?!
        if( $resp->code == 200 ) {
            # Successful operation.
            my $ct = $resp->headers->content_type;
            return unless $ct;
            $ct =~ s/;\s+.*//;
            if( $ct eq 'application/x-ndjson' ) {
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
                        $res->push(
                            AI::Ollama::GenerateChatCompletionResponse->new($payload),

                        );
                    };
                    if( $msg->{state} eq 'finished' ) {
                        $res->finish();
                    }
                });
            }
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

    return $res
}

=head2 C<< copyModel >>

  my $res = $client->copyModel()->get;

Creates a model with another name from an existing model.


=head3 Options

=over 4

=item C<< destination >>

Name of the new model.

=item C<< source >>

Name of the model to copy.

=back


=cut

sub copyModel( $self, %options ) {
    my $method = 'POST';
    my $path = '/copy';
    my $url = Mojo::URL->new( $self->server . $path );

    my $request = AI::Ollama::CopyModelRequest->new( \%options );
    my $tx = $self->ua->build_tx(
        $method => $url,
        {
            "Content-Type" => 'application/json',
        }
        => json => $request->as_hash,
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
            # Successful operation.
            return Future::Mojo->done($resp);
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

=head2 C<< createModel >>

  use Future::Utils 'repeat';
  my $responses = $client->createModel();
  repeat {
      my ($res) = $responses->shift;
      if( $res ) {
          my $str = $res->get;
          say $str;
      }

      Future::Mojo->done( defined $res );
  } until => sub($done) { $done->get };

Create a model from a Modelfile.


=head3 Options

=over 4

=item C<< modelfile >>

The contents of the Modelfile.

=item C<< name >>

The model name.

Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.

=item C<< stream >>

If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.

=back

Returns a L<< AI::Ollama::CreateModelResponse >>.

=cut

sub createModel( $self, %options ) {
    my $method = 'POST';
    my $path = '/create';
    my $url = Mojo::URL->new( $self->server . $path );

    my $request = AI::Ollama::CreateModelRequest->new( \%options );
    my $tx = $self->ua->build_tx(
        $method => $url,
        {
            'Accept' => 'application/x-ndjson',
            "Content-Type" => 'application/json',
        }
        => json => $request->as_hash,
    );

    # validate our request while developing
    my $results = $self->openapi->validate_request($tx->req);
    if( $results->{error}) {
        say $results;
        say $tx->req->to_string;
    };


    my $r1 = Future::Mojo->new();
    use Future::Queue;
    my $res = Future::Queue->new( prototype => 'Future::Mojo' );
    our @store; # we should use ->retain() instead
    push @store, $r1->then( sub( $tx ) {
        my $resp = $tx->res;
        # Should we validate using OpenAPI::Modern here?!
        if( $resp->code == 200 ) {
            # Successful operation.
            my $ct = $resp->headers->content_type;
            return unless $ct;
            $ct =~ s/;\s+.*//;
            if( $ct eq 'application/x-ndjson' ) {
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
                        $res->push(
                            AI::Ollama::CreateModelResponse->new($payload),

                        );
                    };
                    if( $msg->{state} eq 'finished' ) {
                        $res->finish();
                    }
                });
            }
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

    return $res
}

=head2 C<< deleteModel >>

  my $res = $client->deleteModel()->get;

Delete a model and its data.


=head3 Options

=over 4

=item C<< name >>

The model name.

Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.

=back


=cut

sub deleteModel( $self, %options ) {
    my $method = 'DELETE';
    my $path = '/delete';
    my $url = Mojo::URL->new( $self->server . $path );

    my $request = AI::Ollama::DeleteModelRequest->new( \%options );
    my $tx = $self->ua->build_tx(
        $method => $url,
        {
            "Content-Type" => 'application/json',
        }
        => json => $request->as_hash,
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
            # Successful operation.
            return Future::Mojo->done($resp);
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

=head2 C<< generateEmbedding >>

  my $res = $client->generateEmbedding()->get;

Generate embeddings from a model.


=head3 Options

=over 4

=item C<< model >>

The model name.

Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.

=item C<< options >>

Additional model parameters listed in the documentation for the Modelfile such as `temperature`.

=item C<< prompt >>

Text to generate embeddings for.

=back

Returns a L<< AI::Ollama::GenerateEmbeddingResponse >>.

=cut

sub generateEmbedding( $self, %options ) {
    my $method = 'POST';
    my $path = '/embeddings';
    my $url = Mojo::URL->new( $self->server . $path );

    my $request = AI::Ollama::GenerateEmbeddingRequest->new( \%options );
    my $tx = $self->ua->build_tx(
        $method => $url,
        {
            'Accept' => 'application/json',
            "Content-Type" => 'application/json',
        }
        => json => $request->as_hash,
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
            # Successful operation.
            my $ct = $resp->headers->content_type;
            $ct =~ s/;\s+.*//;
            if( $ct eq 'application/json' ) {
                my $payload = $resp->json();
                return Future::Mojo->done(
                    AI::Ollama::GenerateEmbeddingResponse->new($payload),

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

=head2 C<< generateCompletion >>

  use Future::Utils 'repeat';
  my $responses = $client->generateCompletion();
  repeat {
      my ($res) = $responses->shift;
      if( $res ) {
          my $str = $res->get;
          say $str;
      }

      Future::Mojo->done( defined $res );
  } until => sub($done) { $done->get };

Generate a response for a given prompt with a provided model.


=head3 Options

=over 4

=item C<< context >>

The context parameter returned from a previous request to [generateCompletion], this can be used to keep a short conversational memory.

=item C<< format >>

The format to return a response in. Currently the only accepted value is json.

Enable JSON mode by setting the format parameter to json. This will structure the response as valid JSON.

Note: it's important to instruct the model to use JSON in the prompt. Otherwise, the model may generate large amounts whitespace.

=item C<< images >>

(optional) a list of Base64-encoded images to include in the message (for multimodal models such as llava)

=item C<< keep_alive >>

How long (in minutes) to keep the model loaded in memory.

- If set to a positive duration (e.g. 20), the model will stay loaded for the provided duration.
- If set to a negative duration (e.g. -1), the model will stay loaded indefinitely.
- If set to 0, the model will be unloaded immediately once finished.
- If not set, the model will stay loaded for 5 minutes by default

=item C<< model >>

The model name.

Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.

=item C<< options >>

Additional model parameters listed in the documentation for the Modelfile such as `temperature`.

=item C<< prompt >>

The prompt to generate a response.

=item C<< raw >>

If `true` no formatting will be applied to the prompt and no context will be returned.

You may choose to use the `raw` parameter if you are specifying a full templated prompt in your request to the API, and are managing history yourself.

=item C<< stream >>

If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.

=item C<< system >>

The system prompt to (overrides what is defined in the Modelfile).

=item C<< template >>

The full prompt or prompt template (overrides what is defined in the Modelfile).

=back

Returns a L<< AI::Ollama::GenerateCompletionResponse >>.

=cut

sub generateCompletion( $self, %options ) {
    my $method = 'POST';
    my $path = '/generate';
    my $url = Mojo::URL->new( $self->server . $path );

    my $request = AI::Ollama::GenerateCompletionRequest->new( \%options );
    my $tx = $self->ua->build_tx(
        $method => $url,
        {
            'Accept' => 'application/x-ndjson',
            "Content-Type" => 'application/json',
        }
        => json => $request->as_hash,
    );

    # validate our request while developing
    my $results = $self->openapi->validate_request($tx->req);
    if( $results->{error}) {
        say $results;
        say $tx->req->to_string;
    };


    my $r1 = Future::Mojo->new();
    use Future::Queue;
    my $res = Future::Queue->new( prototype => 'Future::Mojo' );
    our @store; # we should use ->retain() instead
    push @store, $r1->then( sub( $tx ) {
        my $resp = $tx->res;
        # Should we validate using OpenAPI::Modern here?!
        if( $resp->code == 200 ) {
            # Successful operation.
            my $ct = $resp->headers->content_type;
            return unless $ct;
            $ct =~ s/;\s+.*//;
            if( $ct eq 'application/x-ndjson' ) {
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
                        $res->push(
                            AI::Ollama::GenerateCompletionResponse->new($payload),

                        );
                    };
                    if( $msg->{state} eq 'finished' ) {
                        $res->finish();
                    }
                });
            }
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

    return $res
}

=head2 C<< pullModel >>

  my $res = $client->pullModel()->get;

Download a model from the ollama library.


=head3 Options

=over 4

=item C<< insecure >>

Allow insecure connections to the library.

Only use this if you are pulling from your own library during development.

=item C<< name >>

The model name.

Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.

=item C<< stream >>

If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.

=back

Returns a L<< AI::Ollama::PullModelResponse >>.

=cut

sub pullModel( $self, %options ) {
    my $method = 'POST';
    my $path = '/pull';
    my $url = Mojo::URL->new( $self->server . $path );

    my $request = AI::Ollama::PullModelRequest->new( \%options );
    my $tx = $self->ua->build_tx(
        $method => $url,
        {
            'Accept' => 'application/json',
            "Content-Type" => 'application/json',
        }
        => json => $request->as_hash,
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
            # Successful operation.
            my $ct = $resp->headers->content_type;
            $ct =~ s/;\s+.*//;
            if( $ct eq 'application/json' ) {
                my $payload = $resp->json();
                return Future::Mojo->done(
                    AI::Ollama::PullModelResponse->new($payload),

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

=head2 C<< pushModel >>

  my $res = $client->pushModel()->get;

Upload a model to a model library.


=head3 Options

=over 4

=item C<< insecure >>

Allow insecure connections to the library.

Only use this if you are pushing to your library during development.

=item C<< name >>

The name of the model to push in the form of <namespace>/<model>:<tag>.

=item C<< stream >>

If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.

=back

Returns a L<< AI::Ollama::PushModelResponse >>.

=cut

sub pushModel( $self, %options ) {
    my $method = 'POST';
    my $path = '/push';
    my $url = Mojo::URL->new( $self->server . $path );

    my $request = AI::Ollama::PushModelRequest->new( \%options );
    my $tx = $self->ua->build_tx(
        $method => $url,
        {
            'Accept' => 'application/json',
            "Content-Type" => 'application/json',
        }
        => json => $request->as_hash,
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
            # Successful operation.
            my $ct = $resp->headers->content_type;
            $ct =~ s/;\s+.*//;
            if( $ct eq 'application/json' ) {
                my $payload = $resp->json();
                return Future::Mojo->done(
                    AI::Ollama::PushModelResponse->new($payload),

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

=head2 C<< showModelInfo >>

  my $res = $client->showModelInfo()->get;

Show details about a model including modelfile, template, parameters, license, and system prompt.


=head3 Options

=over 4

=item C<< name >>

The model name.

Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.

=back

Returns a L<< AI::Ollama::ModelInfo >>.

=cut

sub showModelInfo( $self, %options ) {
    my $method = 'POST';
    my $path = '/show';
    my $url = Mojo::URL->new( $self->server . $path );

    my $request = AI::Ollama::ModelInfoRequest->new( \%options );
    my $tx = $self->ua->build_tx(
        $method => $url,
        {
            'Accept' => 'application/json',
            "Content-Type" => 'application/json',
        }
        => json => $request->as_hash,
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
            # Successful operation.
            my $ct = $resp->headers->content_type;
            $ct =~ s/;\s+.*//;
            if( $ct eq 'application/json' ) {
                my $payload = $resp->json();
                return Future::Mojo->done(
                    AI::Ollama::ModelInfo->new($payload),

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

=head2 C<< listModels >>

  my $res = $client->listModels()->get;

List models that are available locally.


Returns a L<< AI::Ollama::ModelsResponse >>.

=cut

sub listModels( $self, %options ) {
    my $method = 'GET';
    my $path = '/tags';
    my $url = Mojo::URL->new( $self->server . $path );

    my $tx = $self->ua->build_tx(
        $method => $url,
        {
            'Accept' => 'application/json',
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
            # Successful operation.
            my $ct = $resp->headers->content_type;
            $ct =~ s/;\s+.*//;
            if( $ct eq 'application/json' ) {
                my $payload = $resp->json();
                return Future::Mojo->done(
                    AI::Ollama::ModelsResponse->new($payload),

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
