package JIRA::API::WorkflowTransitionRulesDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::WorkflowTransitionRulesDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::WorkflowTransitionRulesDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< workflowId >>

Properties that identify a workflow.

=cut

has 'workflowId' => (
    is       => 'ro',
    isa      => Object,
    required => 1,
);

=head2 C<< workflowRuleIds >>

The list of connect workflow rule IDs.

=cut

has 'workflowRuleIds' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
    required => 1,
);


1;
