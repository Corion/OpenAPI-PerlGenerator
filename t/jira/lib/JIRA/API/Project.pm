package JIRA::API::Project 0.01;
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

=head2 C<< archived >>

Whether the project is archived.

=cut

has 'archived' => (
    is       => 'ro',
);

=head2 C<< archivedBy >>

The user who archived the project.

=cut

has 'archivedBy' => (
    is       => 'ro',
);

=head2 C<< archivedDate >>

The date when the project was archived.

=cut

has 'archivedDate' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< assigneeType >>

The default assignee when creating issues for this project.

=cut

has 'assigneeType' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< avatarUrls >>

The URLs of the project's avatars.

=cut

has 'avatarUrls' => (
    is       => 'ro',
);

=head2 C<< components >>

List of the components contained in the project.

=cut

has 'components' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< deleted >>

Whether the project is marked as deleted.

=cut

has 'deleted' => (
    is       => 'ro',
);

=head2 C<< deletedBy >>

The user who marked the project as deleted.

=cut

has 'deletedBy' => (
    is       => 'ro',
);

=head2 C<< deletedDate >>

The date when the project was marked as deleted.

=cut

has 'deletedDate' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< description >>

A brief description of the project.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< email >>

An email address associated with the project.

=cut

has 'email' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< expand >>

Expand options that include additional project details in the response.

=cut

has 'expand' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< favourite >>

Whether the project is selected as a favorite.

=cut

has 'favourite' => (
    is       => 'ro',
);

=head2 C<< id >>

The ID of the project.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< insight >>

Insights about the project.

=cut

has 'insight' => (
    is       => 'ro',
);

=head2 C<< isPrivate >>

Whether the project is private.

=cut

has 'isPrivate' => (
    is       => 'ro',
);

=head2 C<< issueTypeHierarchy >>

The issue type hierarchy for the project.

=cut

has 'issueTypeHierarchy' => (
    is       => 'ro',
);

=head2 C<< issueTypes >>

List of the issue types available in the project.

=cut

has 'issueTypes' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< key >>

The key of the project.

=cut

has 'key' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< landingPageInfo >>

The project landing page info.

=cut

has 'landingPageInfo' => (
    is       => 'ro',
);

=head2 C<< lead >>

The username of the project lead.

=cut

has 'lead' => (
    is       => 'ro',
);

=head2 C<< name >>

The name of the project.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< permissions >>

User permissions on the project

=cut

has 'permissions' => (
    is       => 'ro',
);

=head2 C<< projectCategory >>

The category the project belongs to.

=cut

has 'projectCategory' => (
    is       => 'ro',
);

=head2 C<< projectTypeKey >>

The [project type](https://confluence.atlassian.com/x/GwiiLQ#Jiraapplicationsoverview-Productfeaturesandprojecttypes) of the project.

=cut

has 'projectTypeKey' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< properties >>

Map of project properties

=cut

has 'properties' => (
    is       => 'ro',
    isa      => Object,
);

=head2 C<< retentionTillDate >>

The date when the project is deleted permanently.

=cut

has 'retentionTillDate' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< roles >>

The name and self URL for each role defined in the project. For more information, see [Create project role](#api-rest-api-3-role-post).

=cut

has 'roles' => (
    is       => 'ro',
    isa      => Object,
);

=head2 C<< self >>

The URL of the project details.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< simplified >>

Whether the project is simplified.

=cut

has 'simplified' => (
    is       => 'ro',
);

=head2 C<< style >>

The type of the project.

=cut

has 'style' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< url >>

A link to information about this project, such as project documentation.

=cut

has 'url' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< uuid >>

Unique ID for next-gen projects.

=cut

has 'uuid' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< versions >>

The versions defined in the project. For more information, see [Create version](#api-rest-api-3-version-post).

=cut

has 'versions' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);


1;
