package AI::OpenAI::ErrorEvent 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

AI::OpenAI::ErrorEvent -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::ErrorEvent->new();
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
    isa      => HashRef,
    required => 1,
);

=head2 C<< event >>

=cut

has 'event' => (
    is       => 'ro',
    isa      => Enum[
        "error",
    ],
    required => 1,
);


1;
