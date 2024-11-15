package AI::OpenAI::CreateEmbeddingResponse 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

AI::OpenAI::CreateEmbeddingResponse -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::CreateEmbeddingResponse->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< data >>

The list of embeddings generated by the model.

=cut

has 'data' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
    required => 1,
);

=head2 C<< model >>

The name of the model used to generate the embedding.

=cut

has 'model' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< object >>

The object type, which is always "list".

=cut

has 'object' => (
    is       => 'ro',
    isa      => Enum[
        "list",
    ],
    required => 1,
);

=head2 C<< usage >>

The usage information for the request.

=cut

has 'usage' => (
    is       => 'ro',
    isa      => HashRef,
    required => 1,
);


1;
