package AI::OpenAI::CreateTranslationResponseJson 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

AI::OpenAI::CreateTranslationResponseJson -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::CreateTranslationResponseJson->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< text >>

=cut

has 'text' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;