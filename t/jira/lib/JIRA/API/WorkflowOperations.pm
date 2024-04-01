package JIRA::API::WorkflowOperations 0.01;
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

=head2 C<< canDelete >>

Whether the workflow can be deleted.

=cut

has 'canDelete' => (
    is       => 'ro',
    required => 1,
);

=head2 C<< canEdit >>

Whether the workflow can be updated.

=cut

has 'canEdit' => (
    is       => 'ro',
    required => 1,
);


1;
