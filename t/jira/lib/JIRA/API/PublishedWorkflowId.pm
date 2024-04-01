package JIRA::API::PublishedWorkflowId 0.01;
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

=head2 C<< entityId >>

The entity ID of the workflow.

=cut

has 'entityId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the workflow.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
