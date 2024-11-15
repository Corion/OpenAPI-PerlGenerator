package AI::OpenAI::RunStepDetailsToolCallsFunctionObject 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

AI::OpenAI::RunStepDetailsToolCallsFunctionObject -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::RunStepDetailsToolCallsFunctionObject->new();
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
    required => 1,
);

=head2 C<< id >>

The ID of the tool call object.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
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