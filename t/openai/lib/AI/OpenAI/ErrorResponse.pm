package AI::OpenAI::ErrorResponse 0.01;
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

AI::OpenAI::ErrorResponse -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::ErrorResponse->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< error >>

=cut

has 'error' => (
    is       => 'ro',
    isa      => HashRef,
    required => 1,
);


1;
