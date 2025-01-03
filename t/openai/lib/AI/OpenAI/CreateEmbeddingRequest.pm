package AI::OpenAI::CreateEmbeddingRequest 0.01;
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

AI::OpenAI::CreateEmbeddingRequest -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::CreateEmbeddingRequest->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< dimensions >>

The number of dimensions the resulting output embeddings should have. Only supported in `text-embedding-3` and later models.

=cut

has 'dimensions' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< encoding_format >>

The format to return the embeddings in. Can be either `float` or [`base64`](https://pypi.org/project/pybase64/).

=cut

has 'encoding_format' => (
    is       => 'ro',
    isa      => Enum[
        "float",
        "base64",
    ],
);

=head2 C<< input >>

Input text to embed, encoded as a string or array of tokens. To embed multiple inputs in a single request, pass an array of strings or array of token arrays. The input must not exceed the max input tokens for the model (8192 tokens for `text-embedding-ada-002`), cannot be an empty string, and any array must be 2048 dimensions or less. [Example Python code](https://cookbook.openai.com/examples/how_to_count_tokens_with_tiktoken) for counting tokens.

=cut

has 'input' => (
    is       => 'ro',
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

=head2 C<< user >>

A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).

=cut

has 'user' => (
    is       => 'ro',
    isa      => Str,
);


1;
