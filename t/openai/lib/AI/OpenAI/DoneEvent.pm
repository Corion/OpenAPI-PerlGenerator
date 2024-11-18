package AI::OpenAI::DoneEvent 0.01;
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

AI::OpenAI::DoneEvent -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::DoneEvent->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< data >>

=cut

has 'data' => (
    is       => 'ro',
    isa      => Enum[
        "[DONE]",
    ],
    required => 1,
);

=head2 C<< event >>

=cut

has 'event' => (
    is       => 'ro',
    isa      => Enum[
        "done",
    ],
    required => 1,
);


1;
