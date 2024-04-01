package JIRA::API::PermissionGrant 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< holder >>

The user or group being granted the permission. It consists of a `type`, a type-dependent `parameter` and a type-dependent `value`. See [Holder object](../api-group-permission-schemes/#holder-object) in *Get all permission schemes* for more information.

=cut

has 'holder' => (
    is       => 'ro',
);

=head2 C<< id >>

The ID of the permission granted details.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< permission >>

The permission to grant. This permission can be one of the built-in permissions or a custom permission added by an app. See [Built-in permissions](../api-group-permission-schemes/#built-in-permissions) in *Get all permission schemes* for more information about the built-in permissions. See the [project permission](https://developer.atlassian.com/cloud/jira/platform/modules/project-permission/) and [global permission](https://developer.atlassian.com/cloud/jira/platform/modules/global-permission/) module documentation for more information about custom permissions.

=cut

has 'permission' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< self >>

The URL of the permission granted details.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);


1;
