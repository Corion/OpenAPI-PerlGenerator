package Speech::Recognition::Whisper::Transcription 0.01;
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

Speech::Recognition::Whisper::Transcription -

=head1 SYNOPSIS

  my $obj = Speech::Recognition::Whisper::Transcription->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< filename >>

=cut

has 'filename' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< text >>

=cut

has 'text' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
