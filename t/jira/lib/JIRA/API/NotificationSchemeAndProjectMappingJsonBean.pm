package JIRA::API::NotificationSchemeAndProjectMappingJsonBean 0.01;
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

=head2 C<< notificationSchemeId >>

=cut

has 'notificationSchemeId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< projectId >>

=cut

has 'projectId' => (
    is       => 'ro',
    isa      => Str,
);


1;
