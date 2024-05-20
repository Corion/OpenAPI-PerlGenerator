package AI::OpenAPI::CreateChatCompletionRequest 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

AI::OpenAPI::CreateChatCompletionRequest -

=head1 SYNOPSIS

  my $obj = AI::OpenAPI::CreateChatCompletionRequest->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< frequency_penalty >>

Number between -2.0 and 2.0. Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the model's likelihood to repeat the same line verbatim.

[See more information about frequency and presence penalties.](/docs/guides/text-generation/parameter-details)

=cut

has 'frequency_penalty' => (
    is       => 'ro',
    isa      => Num,
);

=head2 C<< function_call >>

Deprecated in favor of `tool_choice`.

Controls which (if any) function is called by the model.
`none` means the model will not call a function and instead generates a message.
`auto` means the model can pick between generating a message or calling a function.
Specifying a particular function via `{"name": "my_function"}` forces the model to call that function.

`none` is the default when no functions are present. `auto` is the default if functions are present.

=cut

has 'function_call' => (
    is       => 'ro',
);

=head2 C<< functions >>

Deprecated in favor of `tools`.

A list of functions the model may generate JSON inputs for.

=cut

has 'functions' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< logit_bias >>

Modify the likelihood of specified tokens appearing in the completion.

Accepts a JSON object that maps tokens (specified by their token ID in the tokenizer) to an associated bias value from -100 to 100. Mathematically, the bias is added to the logits generated by the model prior to sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the relevant token.

=cut

has 'logit_bias' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< logprobs >>

Whether to return log probabilities of the output tokens or not. If true, returns the log probabilities of each output token returned in the `content` of `message`.

=cut

has 'logprobs' => (
    is       => 'ro',
);

=head2 C<< max_tokens >>

The maximum number of [tokens](/tokenizer) that can be generated in the chat completion.

The total length of input tokens and generated tokens is limited by the model's context length. [Example Python code](https://cookbook.openai.com/examples/how_to_count_tokens_with_tiktoken) for counting tokens.

=cut

has 'max_tokens' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< messages >>

A list of messages comprising the conversation so far. [Example Python code](https://cookbook.openai.com/examples/how_to_format_inputs_to_chatgpt_models).

=cut

has 'messages' => (
    is       => 'ro',
    isa      => ArrayRef[],
    required => 1,
);

=head2 C<< model >>

ID of the model to use. See the [model endpoint compatibility](/docs/models/model-endpoint-compatibility) table for details on which models work with the Chat API.

=cut

has 'model' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< n >>

How many chat completion choices to generate for each input message. Note that you will be charged based on the number of generated tokens across all of the choices. Keep `n` as `1` to minimize costs.

=cut

has 'n' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< presence_penalty >>

Number between -2.0 and 2.0. Positive values penalize new tokens based on whether they appear in the text so far, increasing the model's likelihood to talk about new topics.

[See more information about frequency and presence penalties.](/docs/guides/text-generation/parameter-details)

=cut

has 'presence_penalty' => (
    is       => 'ro',
    isa      => Num,
);

=head2 C<< response_format >>

An object specifying the format that the model must output. Compatible with [GPT-4 Turbo](/docs/models/gpt-4-and-gpt-4-turbo) and all GPT-3.5 Turbo models newer than `gpt-3.5-turbo-1106`.

Setting to `{ "type": "json_object" }` enables JSON mode, which guarantees the message the model generates is valid JSON.

**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note that the message content may be partially cut off if `finish_reason="length"`, which indicates the generation exceeded `max_tokens` or the conversation exceeded the max context length.

=cut

has 'response_format' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< seed >>

This feature is in Beta.
If specified, our system will make a best effort to sample deterministically, such that repeated requests with the same `seed` and parameters should return the same result.
Determinism is not guaranteed, and you should refer to the `system_fingerprint` response parameter to monitor changes in the backend.

=cut

has 'seed' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< stop >>

Up to 4 sequences where the API will stop generating further tokens.

=cut

has 'stop' => (
    is       => 'ro',
);

=head2 C<< stream >>

If set, partial message deltas will be sent, like in ChatGPT. Tokens will be sent as data-only [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format) as they become available, with the stream terminated by a `data: [DONE]` message. [Example Python code](https://cookbook.openai.com/examples/how_to_stream_completions).

=cut

has 'stream' => (
    is       => 'ro',
);

=head2 C<< stream_options >>

Options for streaming response. Only set this when you set `stream: true`.

=cut

has 'stream_options' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< temperature >>

What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.

We generally recommend altering this or `top_p` but not both.

=cut

has 'temperature' => (
    is       => 'ro',
    isa      => Num,
);

=head2 C<< tool_choice >>

Controls which (if any) tool is called by the model.
`none` means the model will not call any tool and instead generates a message.
`auto` means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools.
Specifying a particular tool via `{"type": "function", "function": {"name": "my_function"}}` forces the model to call that tool.

`none` is the default when no tools are present. `auto` is the default if tools are present.

=cut

has 'tool_choice' => (
    is       => 'ro',
);

=head2 C<< tools >>

A list of tools the model may call. Currently, only functions are supported as a tool. Use this to provide a list of functions the model may generate JSON inputs for. A max of 128 functions are supported.

=cut

has 'tools' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< top_logprobs >>

An integer between 0 and 20 specifying the number of most likely tokens to return at each token position, each with an associated log probability. `logprobs` must be set to `true` if this parameter is used.

=cut

has 'top_logprobs' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< top_p >>

An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.

We generally recommend altering this or `temperature` but not both.

=cut

has 'top_p' => (
    is       => 'ro',
    isa      => Num,
);

=head2 C<< user >>

A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).

=cut

has 'user' => (
    is       => 'ro',
    isa      => Str,
);


1;
