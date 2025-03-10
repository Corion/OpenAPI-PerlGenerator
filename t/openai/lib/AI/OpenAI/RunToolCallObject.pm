package AI::OpenAI::RunToolCallObject 0.01;
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

AI::OpenAI::RunToolCallObject -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::RunToolCallObject->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< function >>

The function definition.

=cut

has 'function' => (
    is       => 'ro',
    isa      => HashRef,
    required => 1,
);

=head2 C<< id >>

The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](/docs/api-reference/runs/submitToolOutputs) endpoint.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< type >>

The type of tool call the output is required for. For now, this is always `function`.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Enum[
        "function",
    ],
    required => 1,
);


1;
