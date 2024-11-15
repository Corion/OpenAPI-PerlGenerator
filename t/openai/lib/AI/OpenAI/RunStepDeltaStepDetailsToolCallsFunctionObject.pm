package AI::OpenAI::RunStepDeltaStepDetailsToolCallsFunctionObject 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

AI::OpenAI::RunStepDeltaStepDetailsToolCallsFunctionObject -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::RunStepDeltaStepDetailsToolCallsFunctionObject->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< function >>

The definition of the function that was called.

=cut

has 'function' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< id >>

The ID of the tool call object.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< index >>

The index of the tool call in the tool calls array.

=cut

has 'index' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< type >>

The type of tool call. This is always going to be `function` for this type of tool call.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Enum[
        "function",
    ],
    required => 1,
);


1;
