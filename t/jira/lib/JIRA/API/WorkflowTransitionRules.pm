package JIRA::API::WorkflowTransitionRules 0.01;
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

=head2 C<< conditions >>

The list of conditions within the workflow.

=cut

has 'conditions' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< postFunctions >>

The list of post functions within the workflow.

=cut

has 'postFunctions' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< validators >>

The list of validators within the workflow.

=cut

has 'validators' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
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
