package JIRA::API::Dashboard 0.01;
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

JIRA::API::Dashboard -

=head1 SYNOPSIS

  my $obj = JIRA::API::Dashboard->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< automaticRefreshMs >>

The automatic refresh interval for the dashboard in milliseconds.

=cut

has 'automaticRefreshMs' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< description >>

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< editPermissions >>

The details of any edit share permissions for the dashboard.

=cut

has 'editPermissions' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< id >>

The ID of the dashboard.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< isFavourite >>

Whether the dashboard is selected as a favorite by the user.

=cut

has 'isFavourite' => (
    is       => 'ro',
);

=head2 C<< isWritable >>

Whether the current user has permission to edit the dashboard.

=cut

has 'isWritable' => (
    is       => 'ro',
);

=head2 C<< name >>

The name of the dashboard.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< owner >>

The owner of the dashboard.

=cut

has 'owner' => (
    is       => 'ro',
);

=head2 C<< popularity >>

The number of users who have this dashboard as a favorite.

=cut

has 'popularity' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< rank >>

The rank of this dashboard.

=cut

has 'rank' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< self >>

The URL of these dashboard details.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< sharePermissions >>

The details of any view share permissions for the dashboard.

=cut

has 'sharePermissions' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< systemDashboard >>

Whether the current dashboard is system dashboard.

=cut

has 'systemDashboard' => (
    is       => 'ro',
);

=head2 C<< view >>

The URL of the dashboard.

=cut

has 'view' => (
    is       => 'ro',
    isa      => Str,
);


1;
