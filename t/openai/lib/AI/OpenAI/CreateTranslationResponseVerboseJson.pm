package AI::OpenAI::CreateTranslationResponseVerboseJson 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

AI::OpenAI::CreateTranslationResponseVerboseJson -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::CreateTranslationResponseVerboseJson->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< duration >>

The duration of the input audio.

=cut

has 'duration' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< language >>

The language of the output translation (always `english`).

=cut

has 'language' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< segments >>

Segments of the translated text and their corresponding details.

=cut

has 'segments' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< text >>

The translated text.

=cut

has 'text' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
