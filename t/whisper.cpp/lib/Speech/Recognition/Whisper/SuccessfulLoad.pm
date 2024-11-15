package Speech::Recognition::Whisper::SuccessfulLoad 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

Speech::Recognition::Whisper::SuccessfulLoad -

=head1 SYNOPSIS

  my $obj = Speech::Recognition::Whisper::SuccessfulLoad->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< msg >>

=cut

has 'msg' => (
    is       => 'ro',
    isa      => Str,
);


1;
