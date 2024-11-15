package AI::OpenAI::MessageContentTextObject 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

AI::OpenAI::MessageContentTextObject -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::MessageContentTextObject->new();
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
    isa      => HashRef,
    required => 1,
);

=head2 C<< type >>

Always `text`.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Enum[
        "text",
    ],
    required => 1,
);


1;
