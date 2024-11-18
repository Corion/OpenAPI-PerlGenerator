package AI::OpenAI::ListAssistantsResponse 0.01;
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

AI::OpenAI::ListAssistantsResponse -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::ListAssistantsResponse->new();
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
    isa      => ArrayRef[HashRef],
    required => 1,
);

=head2 C<< first_id >>

=cut

has 'first_id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< has_more >>

=cut

has 'has_more' => (
    is       => 'ro',
    required => 1,
);

=head2 C<< last_id >>

=cut

has 'last_id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< object >>

=cut

has 'object' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
