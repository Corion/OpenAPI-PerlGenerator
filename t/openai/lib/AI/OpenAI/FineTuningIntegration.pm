package AI::OpenAI::FineTuningIntegration 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

AI::OpenAI::FineTuningIntegration -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::FineTuningIntegration->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< type >>

The type of the integration being enabled for the fine-tuning job

=cut

has 'type' => (
    is       => 'ro',
    isa      => Enum[
        "wandb",
    ],
    required => 1,
);

=head2 C<< wandb >>

The settings for your integration with Weights and Biases. This payload specifies the project that
metrics will be sent to. Optionally, you can set an explicit display name for your run, add tags
to your run, and set a default entity (team, username, etc) to be associated with your run.

=cut

has 'wandb' => (
    is       => 'ro',
    isa      => HashRef,
    required => 1,
);


1;