package JIRA::API::Context 0.01;
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

The ID of the context.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< name >>

The name of the context.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< scope >>

The scope of the context.

=cut

has 'scope' => (
    is       => 'ro',
);


1;
