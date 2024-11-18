package AI::OpenAI::RunStepDetailsToolCallsCodeObject 0.01;
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

AI::OpenAI::RunStepDetailsToolCallsCodeObject -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::RunStepDetailsToolCallsCodeObject->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< code_interpreter >>

The Code Interpreter tool call definition.

=cut

has 'code_interpreter' => (
    is       => 'ro',
    isa      => HashRef,
    required => 1,
);

=head2 C<< id >>

The ID of the tool call.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< type >>

The type of tool call. This is always going to be `code_interpreter` for this type of tool call.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Enum[
        "code_interpreter",
    ],
    required => 1,
);


1;
