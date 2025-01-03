package AI::OpenAI::ChatCompletionMessageToolCallChunk 0.01;
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

AI::OpenAI::ChatCompletionMessageToolCallChunk -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::ChatCompletionMessageToolCallChunk->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< function >>

=cut

has 'function' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< id >>

The ID of the tool call.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< index >>

=cut

has 'index' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< type >>

The type of the tool. Currently, only `function` is supported.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Enum[
        "function",
    ],
);


1;
