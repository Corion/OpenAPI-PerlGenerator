package JIRA::API::UnrestrictedUserEmail 0.01;
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

=head2 C<< accountId >>

The accountId of the user

=cut

has 'accountId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< email >>

The email of the user

=cut

has 'email' => (
    is       => 'ro',
    isa      => Str,
);


1;
