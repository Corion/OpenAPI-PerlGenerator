package JIRA::API::SharePermission 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::SharePermission -

=head1 SYNOPSIS

  my $obj = JIRA::API::SharePermission->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< group >>

The group that the filter is shared with. For a request, specify the `groupId` or `name` property for the group. As a group's name can change, use of `groupId` is recommended.

=cut

has 'group' => (
    is       => 'ro',
);

=head2 C<< id >>

The unique identifier of the share permission.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< project >>

The project that the filter is shared with. This is similar to the project object returned by [Get project](#api-rest-api-3-project-projectIdOrKey-get) but it contains a subset of the properties, which are: `self`, `id`, `key`, `assigneeType`, `name`, `roles`, `avatarUrls`, `projectType`, `simplified`.  
For a request, specify the `id` for the project.

=cut

has 'project' => (
    is       => 'ro',
);

=head2 C<< role >>

The project role that the filter is shared with.  
For a request, specify the `id` for the role. You must also specify the `project` object and `id` for the project that the role is in.

=cut

has 'role' => (
    is       => 'ro',
);

=head2 C<< type >>

The type of share permission:

 *  `user` Shared with a user.
 *  `group` Shared with a group. If set in a request, then specify `sharePermission.group` as well.
 *  `project` Shared with a project. If set in a request, then specify `sharePermission.project` as well.
 *  `projectRole` Share with a project role in a project. This value is not returned in responses. It is used in requests, where it needs to be specify with `projectId` and `projectRoleId`.
 *  `global` Shared globally. If set in a request, no other `sharePermission` properties need to be specified.
 *  `loggedin` Shared with all logged-in users. Note: This value is set in a request by specifying `authenticated` as the `type`.
 *  `project-unknown` Shared with a project that the user does not have access to. Cannot be set in a request.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< user >>

The user account ID that the filter is shared with. For a request, specify the `accountId` property for the user.

=cut

has 'user' => (
    is       => 'ro',
);


1;
