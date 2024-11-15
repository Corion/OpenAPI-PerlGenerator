package AI::OpenAI::CreateTranscriptionResponseVerboseJson 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

AI::OpenAI::CreateTranscriptionResponseVerboseJson -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::CreateTranscriptionResponseVerboseJson->new();
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

The language of the input audio.

=cut

has 'language' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< segments >>

Segments of the transcribed text and their corresponding details.

=cut

has 'segments' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< text >>

The transcribed text.

=cut

has 'text' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< words >>

Extracted words and their corresponding timestamps.

=cut

has 'words' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);


1;