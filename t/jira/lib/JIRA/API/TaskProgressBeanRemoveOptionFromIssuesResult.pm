package JIRA::API::TaskProgressBeanRemoveOptionFromIssuesResult 0.01;
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

The description of the task.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< elapsedRuntime >>

The execution time of the task, in milliseconds.

=cut

has 'elapsedRuntime' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< finished >>

A timestamp recording when the task was finished.

=cut

has 'finished' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< id >>

The ID of the task.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< lastUpdate >>

A timestamp recording when the task progress was last updated.

=cut

has 'lastUpdate' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< message >>

Information about the progress of the task.

=cut

has 'message' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< progress >>

The progress of the task, as a percentage complete.

=cut

has 'progress' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< result >>

The result of the task execution.

=cut

has 'result' => (
    is       => 'ro',
);

=head2 C<< self >>

The URL of the task.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< started >>

A timestamp recording when the task was started.

=cut

has 'started' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< status >>

The status of the task.

=cut

has 'status' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< submitted >>

A timestamp recording when the task was submitted.

=cut

has 'submitted' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< submittedBy >>

The ID of the user who submitted the task.

=cut

has 'submittedBy' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);


1;
