package JIRA::API::WorkflowScheme 0.01;
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

=head2 C<< defaultWorkflow >>

The name of the default workflow for the workflow scheme. The default workflow has *All Unassigned Issue Types* assigned to it in Jira. If `defaultWorkflow` is not specified when creating a workflow scheme, it is set to *Jira Workflow (jira)*.

=cut

has 'defaultWorkflow' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< description >>

The description of the workflow scheme.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< draft >>

Whether the workflow scheme is a draft or not.

=cut

has 'draft' => (
    is       => 'ro',
);

=head2 C<< id >>

The ID of the workflow scheme.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< issueTypeMappings >>

The issue type to workflow mappings, where each mapping is an issue type ID and workflow name pair. Note that an issue type can only be mapped to one workflow in a workflow scheme.

=cut

has 'issueTypeMappings' => (
    is       => 'ro',
    isa      => Object,
);

=head2 C<< issueTypes >>

The issue types available in Jira.

=cut

has 'issueTypes' => (
    is       => 'ro',
    isa      => Object,
);

=head2 C<< lastModified >>

The date-time that the draft workflow scheme was last modified. A modification is a change to the issue type-project mappings only. This property does not apply to non-draft workflows.

=cut

has 'lastModified' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< lastModifiedUser >>

The user that last modified the draft workflow scheme. A modification is a change to the issue type-project mappings only. This property does not apply to non-draft workflows.

=cut

has 'lastModifiedUser' => (
    is       => 'ro',
);

=head2 C<< name >>

The name of the workflow scheme. The name must be unique. The maximum length is 255 characters. Required when creating a workflow scheme.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< originalDefaultWorkflow >>

For draft workflow schemes, this property is the name of the default workflow for the original workflow scheme. The default workflow has *All Unassigned Issue Types* assigned to it in Jira.

=cut

has 'originalDefaultWorkflow' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< originalIssueTypeMappings >>

For draft workflow schemes, this property is the issue type to workflow mappings for the original workflow scheme, where each mapping is an issue type ID and workflow name pair. Note that an issue type can only be mapped to one workflow in a workflow scheme.

=cut

has 'originalIssueTypeMappings' => (
    is       => 'ro',
    isa      => Object,
);

=head2 C<< self >>

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< updateDraftIfNeeded >>

Whether to create or update a draft workflow scheme when updating an active workflow scheme. An active workflow scheme is a workflow scheme that is used by at least one project. The following examples show how this property works:

 *  Update an active workflow scheme with `updateDraftIfNeeded` set to `true`: If a draft workflow scheme exists, it is updated. Otherwise, a draft workflow scheme is created.
 *  Update an active workflow scheme with `updateDraftIfNeeded` set to `false`: An error is returned, as active workflow schemes cannot be updated.
 *  Update an inactive workflow scheme with `updateDraftIfNeeded` set to `true`: The workflow scheme is updated, as inactive workflow schemes do not require drafts to update.

Defaults to `false`.

=cut

has 'updateDraftIfNeeded' => (
    is       => 'ro',
);


1;
