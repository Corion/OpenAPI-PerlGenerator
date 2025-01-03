package JIRA::API::ComponentWithIssueCount 0.01;
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

JIRA::API::ComponentWithIssueCount -

=head1 SYNOPSIS

  my $obj = JIRA::API::ComponentWithIssueCount->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< assignee >>

The details of the user associated with `assigneeType`, if any. See `realAssignee` for details of the user assigned to issues created with this component.

=cut

has 'assignee' => (
    is       => 'ro',
);

=head2 C<< assigneeType >>

The nominal user type used to determine the assignee for issues created with this component. See `realAssigneeType` for details on how the type of the user, and hence the user, assigned to issues is determined. Takes the following values:

 *  `PROJECT_LEAD` the assignee to any issues created with this component is nominally the lead for the project the component is in.
 *  `COMPONENT_LEAD` the assignee to any issues created with this component is nominally the lead for the component.
 *  `UNASSIGNED` an assignee is not set for issues created with this component.
 *  `PROJECT_DEFAULT` the assignee to any issues created with this component is nominally the default assignee for the project that the component is in.

=cut

has 'assigneeType' => (
    is       => 'ro',
    isa      => Enum[
        "PROJECT_DEFAULT",
        "COMPONENT_LEAD",
        "PROJECT_LEAD",
        "UNASSIGNED",
    ],
);

=head2 C<< description >>

The description for the component.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< id >>

The unique identifier for the component.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< isAssigneeTypeValid >>

Whether a user is associated with `assigneeType`. For example, if the `assigneeType` is set to `COMPONENT_LEAD` but the component lead is not set, then `false` is returned.

=cut

has 'isAssigneeTypeValid' => (
    is       => 'ro',
);

=head2 C<< issueCount >>

Count of issues for the component.

=cut

has 'issueCount' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< lead >>

The user details for the component's lead user.

=cut

has 'lead' => (
    is       => 'ro',
);

=head2 C<< name >>

The name for the component.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< project >>

The key of the project to which the component is assigned.

=cut

has 'project' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< projectId >>

Not used.

=cut

has 'projectId' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< realAssignee >>

The user assigned to issues created with this component, when `assigneeType` does not identify a valid assignee.

=cut

has 'realAssignee' => (
    is       => 'ro',
);

=head2 C<< realAssigneeType >>

The type of the assignee that is assigned to issues created with this component, when an assignee cannot be set from the `assigneeType`. For example, `assigneeType` is set to `COMPONENT_LEAD` but no component lead is set. This property is set to one of the following values:

 *  `PROJECT_LEAD` when `assigneeType` is `PROJECT_LEAD` and the project lead has permission to be assigned issues in the project that the component is in.
 *  `COMPONENT_LEAD` when `assignee`Type is `COMPONENT_LEAD` and the component lead has permission to be assigned issues in the project that the component is in.
 *  `UNASSIGNED` when `assigneeType` is `UNASSIGNED` and Jira is configured to allow unassigned issues.
 *  `PROJECT_DEFAULT` when none of the preceding cases are true.

=cut

has 'realAssigneeType' => (
    is       => 'ro',
    isa      => Enum[
        "PROJECT_DEFAULT",
        "COMPONENT_LEAD",
        "PROJECT_LEAD",
        "UNASSIGNED",
    ],
);

=head2 C<< self >>

The URL for this count of the issues contained in the component.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);


1;
