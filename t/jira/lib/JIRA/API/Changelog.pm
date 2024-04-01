package JIRA::API::Changelog 0.01;
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

=head2 C<< author >>

The user who made the change.

=cut

has 'author' => (
    is       => 'ro',
);

=head2 C<< created >>

The date on which the change took place.

=cut

has 'created' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< historyMetadata >>

The history metadata associated with the changed.

=cut

has 'historyMetadata' => (
    is       => 'ro',
);

=head2 C<< id >>

The ID of the changelog.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< items >>

The list of items changed.

=cut

has 'items' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);


1;
