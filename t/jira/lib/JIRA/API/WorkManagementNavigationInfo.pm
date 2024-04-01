package JIRA::API::WorkManagementNavigationInfo 0.01;
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

=head2 C<< boardName >>

=cut

has 'boardName' => (
    is       => 'ro',
    isa      => Str,
);


1;
