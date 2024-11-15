package AI::OpenAI::MessageObject 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

AI::OpenAI::MessageObject -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::MessageObject->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< assistant_id >>

If applicable, the ID of the [assistant](/docs/api-reference/assistants) that authored this message.

=cut

has 'assistant_id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< attachments >>

A list of files attached to the message, and the tools they were added to.

=cut

has 'attachments' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
    required => 1,
);

=head2 C<< completed_at >>

The Unix timestamp (in seconds) for when the message was completed.

=cut

has 'completed_at' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< content >>

The content of the message in array of text and/or images.

=cut

has 'content' => (
    is       => 'ro',
    isa      => ArrayRef[],
    required => 1,
);

=head2 C<< created_at >>

The Unix timestamp (in seconds) for when the message was created.

=cut

has 'created_at' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< id >>

The identifier, which can be referenced in API endpoints.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< incomplete_at >>

The Unix timestamp (in seconds) for when the message was marked as incomplete.

=cut

has 'incomplete_at' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< incomplete_details >>

On an incomplete message, details about why the message is incomplete.

=cut

has 'incomplete_details' => (
    is       => 'ro',
    isa      => HashRef,
    required => 1,
);

=head2 C<< metadata >>

Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format. Keys can be a maximum of 64 characters long and values can be a maxium of 512 characters long.

=cut

has 'metadata' => (
    is       => 'ro',
    isa      => HashRef,
    required => 1,
);

=head2 C<< object >>

The object type, which is always `thread.message`.

=cut

has 'object' => (
    is       => 'ro',
    isa      => Enum[
        "thread.message",
    ],
    required => 1,
);

=head2 C<< role >>

The entity that produced the message. One of `user` or `assistant`.

=cut

has 'role' => (
    is       => 'ro',
    isa      => Enum[
        "user",
        "assistant",
    ],
    required => 1,
);

=head2 C<< run_id >>

The ID of the [run](/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.

=cut

has 'run_id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< status >>

The status of the message, which can be either `in_progress`, `incomplete`, or `completed`.

=cut

has 'status' => (
    is       => 'ro',
    isa      => Enum[
        "in_progress",
        "incomplete",
        "completed",
    ],
    required => 1,
);

=head2 C<< thread_id >>

The [thread](/docs/api-reference/threads) ID that this message belongs to.

=cut

has 'thread_id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
