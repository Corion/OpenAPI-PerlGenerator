package AI::OpenAI::ChatCompletionRequestToolMessage 0.01;
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

AI::OpenAI::ChatCompletionRequestToolMessage -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::ChatCompletionRequestToolMessage->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< content >>

The contents of the tool message.

=cut

has 'content' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< role >>

The role of the messages author, in this case `tool`.

=cut

has 'role' => (
    is       => 'ro',
    isa      => Enum[
        "tool",
    ],
    required => 1,
);

=head2 C<< tool_call_id >>

Tool call that this message is responding to.

=cut

has 'tool_call_id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
