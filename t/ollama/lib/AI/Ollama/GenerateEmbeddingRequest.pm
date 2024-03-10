package AI::Ollama::GenerateEmbeddingRequest 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

sub as_hash( $self ) {
    return { $self->%* }
}

=head2 C<< model >>

The model name.

Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.

=cut

has 'model' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< options >>

Additional model parameters listed in the documentation for the Modelfile such as `temperature`.

=cut

has 'options' => (
    is       => 'ro',
    isa      => Object,
);

=head2 C<< prompt >>

Text to generate embeddings for.

=cut

has 'prompt' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
