package JIRA::API::AvailableDashboardGadget 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::AvailableDashboardGadget -

=head1 SYNOPSIS

  my $obj = JIRA::API::AvailableDashboardGadget->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< moduleKey >>

The module key of the gadget type.

=cut

has 'moduleKey' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< title >>

The title of the gadget.

=cut

has 'title' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< uri >>

The URI of the gadget type.

=cut

has 'uri' => (
    is       => 'ro',
    isa      => Str,
);


1;
