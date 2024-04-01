package JIRA::API::StatusCreateRequest 0.01;
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

=head2 C<< scope >>

The scope of the status.

=cut

has 'scope' => (
    is       => 'ro',
    isa      => Object,
    required => 1,
);

=head2 C<< statuses >>

Details of the statuses being created.

=cut

has 'statuses' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
    required => 1,
);


1;
