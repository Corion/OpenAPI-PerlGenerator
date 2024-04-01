package JIRA::API::UpdateProjectDetails 0.01;
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

=head2 C<< assigneeType >>

The default assignee when creating issues for this project.

=cut

has 'assigneeType' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< avatarId >>

An integer value for the project's avatar.

=cut

has 'avatarId' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< categoryId >>

The ID of the project's category. A complete list of category IDs is found using the [Get all project categories](#api-rest-api-3-projectCategory-get) operation. To remove the project category from the project, set the value to `-1.`

=cut

has 'categoryId' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< description >>

A brief description of the project.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< issueSecurityScheme >>

The ID of the issue security scheme for the project, which enables you to control who can and cannot view issues. Use the [Get issue security schemes](#api-rest-api-3-issuesecurityschemes-get) resource to get all issue security scheme IDs.

=cut

has 'issueSecurityScheme' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< key >>

Project keys must be unique and start with an uppercase letter followed by one or more uppercase alphanumeric characters. The maximum length is 10 characters.

=cut

has 'key' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< lead >>

This parameter is deprecated because of privacy changes. Use `leadAccountId` instead. See the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. The user name of the project lead. Cannot be provided with `leadAccountId`.

=cut

has 'lead' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< leadAccountId >>

The account ID of the project lead. Cannot be provided with `lead`.

=cut

has 'leadAccountId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the project.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< notificationScheme >>

The ID of the notification scheme for the project. Use the [Get notification schemes](#api-rest-api-3-notificationscheme-get) resource to get a list of notification scheme IDs.

=cut

has 'notificationScheme' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< permissionScheme >>

The ID of the permission scheme for the project. Use the [Get all permission schemes](#api-rest-api-3-permissionscheme-get) resource to see a list of all permission scheme IDs.

=cut

has 'permissionScheme' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< url >>

A link to information about this project, such as project documentation

=cut

has 'url' => (
    is       => 'ro',
    isa      => Str,
);


1;
