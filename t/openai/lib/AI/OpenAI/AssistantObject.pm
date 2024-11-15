package AI::OpenAI::AssistantObject 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

AI::OpenAI::AssistantObject -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::AssistantObject->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< created_at >>

The Unix timestamp (in seconds) for when the assistant was created.

=cut

has 'created_at' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< description >>

The description of the assistant. The maximum length is 512 characters.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
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

=head2 C<< instructions >>

The system instructions that the assistant uses. The maximum length is 256,000 characters.

=cut

has 'instructions' => (
    is       => 'ro',
    isa      => Str,
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

=head2 C<< model >>

ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models/overview) for descriptions of them.

=cut

has 'model' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< name >>

The name of the assistant. The maximum length is 256 characters.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< object >>

The object type, which is always `assistant`.

=cut

has 'object' => (
    is       => 'ro',
    isa      => Enum[
        "assistant",
    ],
    required => 1,
);

=head2 C<< response_format >>

Specifies the format that the model must output. Compatible with [GPT-4o](/docs/models/gpt-4o), [GPT-4 Turbo](/docs/models/gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.

Setting to `{ "type": "json_object" }` enables JSON mode, which guarantees the message the model generates is valid JSON.

**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note that the message content may be partially cut off if `finish_reason="length"`, which indicates the generation exceeded `max_tokens` or the conversation exceeded the max context length.

=cut

has 'response_format' => (
    is       => 'ro',
);

=head2 C<< temperature >>

What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.

=cut

has 'temperature' => (
    is       => 'ro',
    isa      => Num,
);

=head2 C<< tool_resources >>

A set of resources that are used by the assistant's tools. The resources are specific to the type of tool. For example, the `code_interpreter` tool requires a list of file IDs, while the `file_search` tool requires a list of vector store IDs.

=cut

has 'tool_resources' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< tools >>

A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code_interpreter`, `file_search`, or `function`.

=cut

has 'tools' => (
    is       => 'ro',
    isa      => ArrayRef[],
    required => 1,
);

=head2 C<< top_p >>

An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.

We generally recommend altering this or temperature but not both.

=cut

has 'top_p' => (
    is       => 'ro',
    isa      => Num,
);


1;