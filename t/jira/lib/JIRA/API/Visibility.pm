package JIRA::API::Visibility 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::Visibility -

=head1 SYNOPSIS

  my $obj = JIRA::API::Visibility->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< identifier >>

The ID of the group or the name of the role that visibility of this item is restricted to.

=cut

has 'identifier' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< type >>

Whether visibility of this item is restricted to a group or role.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Enum[
        "group",
        "role",
    ],
);

=head2 C<< value >>

The name of the group or role that visibility of this item is restricted to. Please note that the name of a group is mutable, to reliably identify a group use `identifier`.

=cut

has 'value' => (
    is       => 'ro',
    isa      => Str,
);


1;
