package JIRA::API::PageOfStatuses 0.01;
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

=head2 C<< isLast >>

Whether this is the last page.

=cut

has 'isLast' => (
    is       => 'ro',
);

=head2 C<< maxResults >>

The maximum number of items that could be returned.

=cut

has 'maxResults' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< nextPage >>

The URL of the next page of results, if any.

=cut

has 'nextPage' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< self >>

The URL of this page.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< startAt >>

The index of the first item returned on the page.

=cut

has 'startAt' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< total >>

Number of items that satisfy the search.

=cut

has 'total' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< values >>

The list of items.

=cut

has 'values' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);


1;
