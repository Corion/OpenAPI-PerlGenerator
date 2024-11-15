package AI::OpenAI::ChatCompletionRequestSystemMessage 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

AI::OpenAI::ChatCompletionRequestSystemMessage -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::ChatCompletionRequestSystemMessage->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< content >>

The contents of the system message.

=cut

has 'content' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< name >>

An optional name for the participant. Provides the model information to differentiate between participants of the same role.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< role >>

The role of the messages author, in this case `system`.

=cut

has 'role' => (
    is       => 'ro',
    isa      => Enum[
        "system",
    ],
    required => 1,
);


1;
