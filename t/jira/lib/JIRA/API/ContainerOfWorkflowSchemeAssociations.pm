package JIRA::API::ContainerOfWorkflowSchemeAssociations 0.01;
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

=head2 C<< values >>

A list of workflow schemes together with projects they are associated with.

=cut

has 'values' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
    required => 1,
);


1;
