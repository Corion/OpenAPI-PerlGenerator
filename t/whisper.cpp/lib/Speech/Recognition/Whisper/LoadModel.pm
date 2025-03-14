package Speech::Recognition::Whisper::LoadModel 0.01;
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

Speech::Recognition::Whisper::LoadModel -

=head1 SYNOPSIS

  my $obj = Speech::Recognition::Whisper::LoadModel->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< model >>

Model file

=cut

has 'model' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< response_format >>

Format of the response

=cut

has 'response_format' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< temperature >>

Temperature

=cut

has 'temperature' => (
    is       => 'ro',
    isa      => Num,
);

=head2 C<< temperature_inc >>

=cut

has 'temperature_inc' => (
    is       => 'ro',
    isa      => Num,
);


1;
