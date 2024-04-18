package JIRA::API::IssueTypesWorkflowMapping 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::IssueTypesWorkflowMapping -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssueTypesWorkflowMapping->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< defaultMapping >>

Whether the workflow is the default workflow for the workflow scheme.

=cut

has 'defaultMapping' => (
    is       => 'ro',
);

=head2 C<< issueTypes >>

The list of issue type IDs.

=cut

has 'issueTypes' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);

=head2 C<< updateDraftIfNeeded >>

Whether a draft workflow scheme is created or updated when updating an active workflow scheme. The draft is updated with the new workflow-issue types mapping. Defaults to `false`.

=cut

has 'updateDraftIfNeeded' => (
    is       => 'ro',
);

=head2 C<< workflow >>

The name of the workflow. Optional if updating the workflow-issue types mapping.

=cut

has 'workflow' => (
    is       => 'ro',
    isa      => Str,
);


1;
