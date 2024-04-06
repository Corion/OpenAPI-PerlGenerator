package JIRA::API::WorkflowTransitionRulesUpdateErrorDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::WorkflowTransitionRulesUpdateErrorDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::WorkflowTransitionRulesUpdateErrorDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< ruleUpdateErrors >>

A list of transition rule update errors, indexed by the transition rule ID. Any transition rule that appears here wasn't updated.

=cut

has 'ruleUpdateErrors' => (
    is       => 'ro',
    isa      => Object,
    required => 1,
);

=head2 C<< updateErrors >>

The list of errors that specify why the workflow update failed. The workflow was not updated if the list contains any entries.

=cut

has 'updateErrors' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
    required => 1,
);

=head2 C<< workflowId >>

Properties that identify a workflow.

=cut

has 'workflowId' => (
    is       => 'ro',
    isa      => Object,
    required => 1,
);


1;