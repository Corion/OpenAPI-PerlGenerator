package JIRA::API::DashboardGadget 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::DashboardGadget -

=head1 SYNOPSIS

  my $obj = JIRA::API::DashboardGadget->new();
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
    isa      => Enum[
        "blue",
        "red",
        "yellow",
        "green",
        "cyan",
        "purple",
        "gray",
        "white",
    ],
    required => 1,
);

=head2 C<< id >>

The ID of the gadget instance.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< moduleKey >>

The module key of the gadget type.

=cut

has 'moduleKey' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< position >>

The position of the gadget.

=cut

has 'position' => (
    is       => 'ro',
    required => 1,
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
