package AI::OpenAI::ChatCompletionRequestAssistantMessage 0.01;
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

AI::OpenAI::ChatCompletionRequestAssistantMessage -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::ChatCompletionRequestAssistantMessage->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< content >>

The contents of the assistant message. Required unless `tool_calls` or `function_call` is specified.

=cut

has 'content' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< function_call >>

Deprecated and replaced by `tool_calls`. The name and arguments of a function that should be called, as generated by the model.

=cut

has 'function_call' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< name >>

An optional name for the participant. Provides the model information to differentiate between participants of the same role.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< role >>

The role of the messages author, in this case `assistant`.

=cut

has 'role' => (
    is       => 'ro',
    isa      => Enum[
        "assistant",
    ],
    required => 1,
);

=head2 C<< tool_calls >>

The tool calls generated by the model, such as function calls.

=cut

has 'tool_calls' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);


1;
