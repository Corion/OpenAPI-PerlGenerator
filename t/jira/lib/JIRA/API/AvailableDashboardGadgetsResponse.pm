package JIRA::API::AvailableDashboardGadgetsResponse 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::AvailableDashboardGadgetsResponse -

=head1 SYNOPSIS

  my $obj = JIRA::API::AvailableDashboardGadgetsResponse->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< gadgets >>

The list of available gadgets.

=cut

has 'gadgets' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
    required => 1,
);


1;