package JIRA::API::ProjectIssueTypeHierarchy 0.01;
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

=head2 C<< hierarchy >>

Details of an issue type hierarchy level.

=cut

has 'hierarchy' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< projectId >>

The ID of the project.

=cut

has 'projectId' => (
    is       => 'ro',
    isa      => Int,
);


1;
