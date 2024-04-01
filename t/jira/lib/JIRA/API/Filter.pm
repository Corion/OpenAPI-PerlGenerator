package JIRA::API::Filter 0.01;
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

=head2 C<< description >>

A description of the filter.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< editPermissions >>

The groups and projects that can edit the filter.

=cut

has 'editPermissions' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< favourite >>

Whether the filter is selected as a favorite.

=cut

has 'favourite' => (
    is       => 'ro',
);

=head2 C<< favouritedCount >>

The count of how many users have selected this filter as a favorite, including the filter owner.

=cut

has 'favouritedCount' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< id >>

The unique identifier for the filter.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< jql >>

The JQL query for the filter. For example, *project = SSP AND issuetype = Bug*.

=cut

has 'jql' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the filter. Must be unique.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< owner >>

The user who owns the filter. This is defaulted to the creator of the filter, however Jira administrators can change the owner of a shared filter in the admin settings.

=cut

has 'owner' => (
    is       => 'ro',
);

=head2 C<< searchUrl >>

A URL to view the filter results in Jira, using the [Search for issues using JQL](#api-rest-api-3-filter-search-get) operation with the filter's JQL string to return the filter results. For example, *https://your-domain.atlassian.net/rest/api/3/search?jql=project+%3D+SSP+AND+issuetype+%3D+Bug*.

=cut

has 'searchUrl' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< self >>

The URL of the filter.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< sharePermissions >>

The groups and projects that the filter is shared with.

=cut

has 'sharePermissions' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< sharedUsers >>

A paginated list of the users that the filter is shared with. This includes users that are members of the groups or can browse the projects that the filter is shared with.

=cut

has 'sharedUsers' => (
    is       => 'ro',
);

=head2 C<< subscriptions >>

A paginated list of the users that are subscribed to the filter.

=cut

has 'subscriptions' => (
    is       => 'ro',
);

=head2 C<< viewUrl >>

A URL to view the filter results in Jira, using the ID of the filter. For example, *https://your-domain.atlassian.net/issues/?filter=10100*.

=cut

has 'viewUrl' => (
    is       => 'ro',
    isa      => Str,
);


1;
