package JIRA::API::DashboardGadgetPosition 0.01;
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

JIRA::API::DashboardGadgetPosition -

=head1 SYNOPSIS

  my $obj = JIRA::API::DashboardGadgetPosition->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< The_column_position_of_the_gadget_ >>

=cut

has 'The_column_position_of_the_gadget_' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< The_row_position_of_the_gadget_ >>

=cut

has 'The_row_position_of_the_gadget_' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);


1;
