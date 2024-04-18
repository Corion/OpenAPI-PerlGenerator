package JIRA::API::DashboardGadgetUpdateRequest 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::DashboardGadgetUpdateRequest -

=head1 SYNOPSIS

  my $obj = JIRA::API::DashboardGadgetUpdateRequest->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< color >>

The color of the gadget. Should be one of `blue`, `red`, `yellow`, `green`, `cyan`, `purple`, `gray`, or `white`.

=cut

has 'color' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< position >>

The position of the gadget.

=cut

has 'position' => (
    is       => 'ro',
);

=head2 C<< title >>

The title of the gadget.

=cut

has 'title' => (
    is       => 'ro',
    isa      => Str,
);


1;
