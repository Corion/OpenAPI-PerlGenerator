package JIRA::API::WorkflowTransition 0.01;
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

=head2 C<< id >>

The transition ID.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< name >>

The transition name.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
