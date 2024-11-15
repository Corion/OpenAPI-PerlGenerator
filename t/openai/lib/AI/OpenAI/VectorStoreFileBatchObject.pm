package AI::OpenAI::VectorStoreFileBatchObject 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

AI::OpenAI::VectorStoreFileBatchObject -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::VectorStoreFileBatchObject->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< created_at >>

The Unix timestamp (in seconds) for when the vector store files batch was created.

=cut

has 'created_at' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< file_counts >>

=cut

has 'file_counts' => (
    is       => 'ro',
    isa      => HashRef,
    required => 1,
);

=head2 C<< id >>

The identifier, which can be referenced in API endpoints.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< object >>

The object type, which is always `vector_store.file_batch`.

=cut

has 'object' => (
    is       => 'ro',
    isa      => Enum[
        "vector_store.files_batch",
    ],
    required => 1,
);

=head2 C<< status >>

The status of the vector store files batch, which can be either `in_progress`, `completed`, `cancelled` or `failed`.

=cut

has 'status' => (
    is       => 'ro',
    isa      => Enum[
        "in_progress",
        "completed",
        "cancelled",
        "failed",
    ],
    required => 1,
);

=head2 C<< vector_store_id >>

The ID of the [vector store](/docs/api-reference/vector-stores/object) that the [File](/docs/api-reference/files) is attached to.

=cut

has 'vector_store_id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;