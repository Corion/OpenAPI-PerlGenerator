package JIRA::API::BulkProjectPermissionGrants 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::BulkProjectPermissionGrants -

=head1 SYNOPSIS

  my $obj = JIRA::API::BulkProjectPermissionGrants->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< issues >>

IDs of the issues the user has the permission for.

=cut

has 'issues' => (
    is       => 'ro',
    isa      => ArrayRef[Int],
    required => 1,
);

=head2 C<< permission >>

A project permission,

=cut

has 'permission' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< projects >>

IDs of the projects the user has the permission for.

=cut

has 'projects' => (
    is       => 'ro',
    isa      => ArrayRef[Int],
    required => 1,
);


1;
