package JIRA::API::FoundGroup 0.01;
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

JIRA::API::FoundGroup -

=head1 SYNOPSIS

  my $obj = JIRA::API::FoundGroup->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< groupId >>

The ID of the group, which uniquely identifies the group across all Atlassian products. For example, *952d12c3-5b5b-4d04-bb32-44d383afc4b2*.

=cut

has 'groupId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< html >>

The group name with the matched query string highlighted with the HTML bold tag.

=cut

has 'html' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< labels >>

=cut

has 'labels' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< name >>

The name of the group. The name of a group is mutable, to reliably identify a group use ``groupId`.`

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);


1;
