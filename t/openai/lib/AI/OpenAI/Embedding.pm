package AI::OpenAI::Embedding 0.01;
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

AI::OpenAI::Embedding -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::Embedding->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< embedding >>

The embedding vector, which is a list of floats. The length of vector depends on the model as listed in the [embedding guide](/docs/guides/embeddings).

=cut

has 'embedding' => (
    is       => 'ro',
    isa      => ArrayRef[Num],
    required => 1,
);

=head2 C<< index >>

The index of the embedding in the list of embeddings.

=cut

has 'index' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< object >>

The object type, which is always "embedding".

=cut

has 'object' => (
    is       => 'ro',
    isa      => Enum[
        "embedding",
    ],
    required => 1,
);


1;
