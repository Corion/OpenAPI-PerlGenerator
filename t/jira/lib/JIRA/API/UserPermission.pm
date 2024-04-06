package JIRA::API::UserPermission 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::UserPermission -

=head1 SYNOPSIS

  my $obj = JIRA::API::UserPermission->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< deprecatedKey >>

Indicate whether the permission key is deprecated. Note that deprecated keys cannot be used in the `permissions parameter of Get my permissions. Deprecated keys are not returned by Get all permissions.`

=cut

has 'deprecatedKey' => (
    is       => 'ro',
);

=head2 C<< description >>

The description of the permission.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< havePermission >>

Whether the permission is available to the user in the queried context.

=cut

has 'havePermission' => (
    is       => 'ro',
);

=head2 C<< id >>

The ID of the permission. Either `id` or `key` must be specified. Use [Get all permissions](#api-rest-api-3-permissions-get) to get the list of permissions.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< key >>

The key of the permission. Either `id` or `key` must be specified. Use [Get all permissions](#api-rest-api-3-permissions-get) to get the list of permissions.

=cut

has 'key' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the permission.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< type >>

The type of the permission.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Str,
);


1;