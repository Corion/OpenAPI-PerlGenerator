package JIRA::API::LicenseMetric 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::LicenseMetric -

=head1 SYNOPSIS

  my $obj = JIRA::API::LicenseMetric->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< key >>

The key of the license metric.

=cut

has 'key' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< value >>

The value for the license metric.

=cut

has 'value' => (
    is       => 'ro',
    isa      => Str,
);


1;
