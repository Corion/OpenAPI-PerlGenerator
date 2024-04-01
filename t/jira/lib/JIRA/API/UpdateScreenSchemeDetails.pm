package JIRA::API::UpdateScreenSchemeDetails 0.01;
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

=head2 C<< description >>

The description of the screen scheme. The maximum length is 255 characters.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the screen scheme. The name must be unique. The maximum length is 255 characters.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< screens >>

The IDs of the screens for the screen types of the screen scheme. Only screens used in classic projects are accepted.

=cut

has 'screens' => (
    is       => 'ro',
);


1;
