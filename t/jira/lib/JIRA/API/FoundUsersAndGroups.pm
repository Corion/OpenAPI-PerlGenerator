package JIRA::API::FoundUsersAndGroups 0.01;
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

JIRA::API::FoundUsersAndGroups -

=head1 SYNOPSIS

  my $obj = JIRA::API::FoundUsersAndGroups->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< groups >>

The list of groups found in a search, including header text (Showing X of Y matching groups) and total of matched groups.

=cut

has 'groups' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< users >>

The list of users found in a search, including header text (Showing X of Y matching users) and total of matched users.

=cut

has 'users' => (
    is       => 'ro',
    isa      => HashRef,
);


1;
