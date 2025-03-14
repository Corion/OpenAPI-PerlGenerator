package AI::OpenAI::RunStepDeltaStepDetailsToolCallsCodeOutputImageObject 0.01;
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

AI::OpenAI::RunStepDeltaStepDetailsToolCallsCodeOutputImageObject -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::RunStepDeltaStepDetailsToolCallsCodeOutputImageObject->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< image >>

=cut

has 'image' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< index >>

The index of the output in the outputs array.

=cut

has 'index' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< type >>

Always `image`.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Enum[
        "image",
    ],
    required => 1,
);


1;
