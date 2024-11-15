package AI::OpenAI::CreateModerationRequest 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

AI::OpenAI::CreateModerationRequest -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::CreateModerationRequest->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< input >>

The input text to classify

=cut

has 'input' => (
    is       => 'ro',
    required => 1,
);

=head2 C<< model >>

Two content moderations models are available: `text-moderation-stable` and `text-moderation-latest`.

The default is `text-moderation-latest` which will be automatically upgraded over time. This ensures you are always using our most accurate model. If you use `text-moderation-stable`, we will provide advanced notice before updating the model. Accuracy of `text-moderation-stable` may be slightly lower than for `text-moderation-latest`.

=cut

has 'model' => (
    is       => 'ro',
    isa      => Str,
);


1;
