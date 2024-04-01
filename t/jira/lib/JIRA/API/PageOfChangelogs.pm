package JIRA::API::PageOfChangelogs 0.01;
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

=head2 C<< histories >>

The list of changelogs.

=cut

has 'histories' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< maxResults >>

The maximum number of results that could be on the page.

=cut

has 'maxResults' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< startAt >>

The index of the first item returned on the page.

=cut

has 'startAt' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< total >>

The number of results on the page.

=cut

has 'total' => (
    is       => 'ro',
    isa      => Int,
);


1;
