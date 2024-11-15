package AI::OpenAI::TranscriptionWord 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

AI::OpenAI::TranscriptionWord -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::TranscriptionWord->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< end >>

End time of the word in seconds.

=cut

has 'end' => (
    is       => 'ro',
    isa      => Num,
    required => 1,
);

=head2 C<< start >>

Start time of the word in seconds.

=cut

has 'start' => (
    is       => 'ro',
    isa      => Num,
    required => 1,
);

=head2 C<< word >>

The text content of the word.

=cut

has 'word' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;