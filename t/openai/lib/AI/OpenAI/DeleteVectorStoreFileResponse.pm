package AI::OpenAI::DeleteVectorStoreFileResponse 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

AI::OpenAI::DeleteVectorStoreFileResponse -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::DeleteVectorStoreFileResponse->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< deleted >>

=cut

has 'deleted' => (
    is       => 'ro',
    required => 1,
);

=head2 C<< id >>

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< object >>

=cut

has 'object' => (
    is       => 'ro',
    isa      => Enum[
        "vector_store.file.deleted",
    ],
    required => 1,
);


1;
