package JIRA::API::Icon 0.01;
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

JIRA::API::Icon -

=head1 SYNOPSIS

  my $obj = JIRA::API::Icon->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< link >>

The URL of the tooltip, used only for a status icon. If not set, the status icon in Jira is not clickable.

=cut

has 'link' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< title >>

The title of the icon. This is used as follows:

 *  For a status icon it is used as a tooltip on the icon. If not set, the status icon doesn't display a tooltip in Jira.
 *  For the remote object icon it is used in conjunction with the application name to display a tooltip for the link's icon. The tooltip takes the format "\[application name\] icon title". Blank itemsare excluded from the tooltip title. If both items are blank, the icon tooltop displays as "Web Link".

=cut

has 'title' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< url16x16 >>

The URL of an icon that displays at 16x16 pixel in Jira.

=cut

has 'url16x16' => (
    is       => 'ro',
    isa      => Str,
);


1;
