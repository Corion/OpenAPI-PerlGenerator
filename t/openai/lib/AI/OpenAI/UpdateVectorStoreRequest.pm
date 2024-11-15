package AI::OpenAI::UpdateVectorStoreRequest 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

AI::OpenAI::UpdateVectorStoreRequest -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::UpdateVectorStoreRequest->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< expires_after >>

The expiration policy for a vector store.

=cut

has 'expires_after' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< metadata >>

Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format. Keys can be a maximum of 64 characters long and values can be a maxium of 512 characters long.

=cut

has 'metadata' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< name >>

The name of the vector store.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);


1;
