package AI::OpenAI::RunStepDetailsToolCallsCodeOutputLogsObject 0.01;
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

AI::OpenAI::RunStepDetailsToolCallsCodeOutputLogsObject -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::RunStepDetailsToolCallsCodeOutputLogsObject->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< logs >>

The text output from the Code Interpreter tool call.

=cut

has 'logs' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< type >>

Always `logs`.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Enum[
        "logs",
    ],
    required => 1,
);


1;
