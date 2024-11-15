package AI::OpenAI::CreateSpeechRequest 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

AI::OpenAI::CreateSpeechRequest -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::CreateSpeechRequest->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< input >>

The text to generate audio for. The maximum length is 4096 characters.

=cut

has 'input' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< model >>

One of the available [TTS models](/docs/models/tts): `tts-1` or `tts-1-hd`

=cut

has 'model' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< response_format >>

The format to audio in. Supported formats are `mp3`, `opus`, `aac`, `flac`, `wav`, and `pcm`.

=cut

has 'response_format' => (
    is       => 'ro',
    isa      => Enum[
        "mp3",
        "opus",
        "aac",
        "flac",
        "wav",
        "pcm",
    ],
);

=head2 C<< speed >>

The speed of the generated audio. Select a value from `0.25` to `4.0`. `1.0` is the default.

=cut

has 'speed' => (
    is       => 'ro',
    isa      => Num,
);

=head2 C<< voice >>

The voice to use when generating the audio. Supported voices are `alloy`, `echo`, `fable`, `onyx`, `nova`, and `shimmer`. Previews of the voices are available in the [Text to speech guide](/docs/guides/text-to-speech/voice-options).

=cut

has 'voice' => (
    is       => 'ro',
    isa      => Enum[
        "alloy",
        "echo",
        "fable",
        "onyx",
        "nova",
        "shimmer",
    ],
    required => 1,
);


1;
