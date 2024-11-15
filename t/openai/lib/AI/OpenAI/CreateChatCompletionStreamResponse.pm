package AI::OpenAI::CreateChatCompletionStreamResponse 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

AI::OpenAI::CreateChatCompletionStreamResponse -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::CreateChatCompletionStreamResponse->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< choices >>

A list of chat completion choices. Can contain more than one elements if `n` is greater than 1. Can also be empty for the
last chunk if you set `stream_options: {"include_usage": true}`.

=cut

has 'choices' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
    required => 1,
);

=head2 C<< created >>

The Unix timestamp (in seconds) of when the chat completion was created. Each chunk has the same timestamp.

=cut

has 'created' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< id >>

A unique identifier for the chat completion. Each chunk has the same ID.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< model >>

The model to generate the completion.

=cut

has 'model' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< object >>

The object type, which is always `chat.completion.chunk`.

=cut

has 'object' => (
    is       => 'ro',
    isa      => Enum[
        "chat.completion.chunk",
    ],
    required => 1,
);

=head2 C<< system_fingerprint >>

This fingerprint represents the backend configuration that the model runs with.
Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.

=cut

has 'system_fingerprint' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< usage >>

An optional field that will only be present when you set `stream_options: {"include_usage": true}` in your request.
When present, it contains a null value except for the last chunk which contains the token usage statistics for the entire request.

=cut

has 'usage' => (
    is       => 'ro',
    isa      => HashRef,
);


1;
