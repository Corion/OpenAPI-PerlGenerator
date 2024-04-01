package JIRA::API::UserList 0.01;
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

=head2 C<< end_index >>

The index of the last item returned on the page.

=cut

has 'end_index' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< items >>

The list of items.

=cut

has 'items' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< max_results >>

The maximum number of results that could be on the page.

=cut

has 'max_results' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< size >>

The number of items on the page.

=cut

has 'size' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< start_index >>

The index of the first item returned on the page.

=cut

has 'start_index' => (
    is       => 'ro',
    isa      => Int,
);


1;
