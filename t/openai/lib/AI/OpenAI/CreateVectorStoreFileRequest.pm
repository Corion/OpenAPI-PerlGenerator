package AI::OpenAI::CreateVectorStoreFileRequest 0.01;
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

AI::OpenAI::CreateVectorStoreFileRequest -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::CreateVectorStoreFileRequest->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< file_id >>

A [File](/docs/api-reference/files) ID that the vector store should use. Useful for tools like `file_search` that can access files.

=cut

has 'file_id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
