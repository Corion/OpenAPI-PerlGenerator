package JIRA::API::CustomFieldContextDefaultValueMultiUserPicker 0.01;
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

=head2 C<< accountIds >>

The IDs of the default users.

=cut

has 'accountIds' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
    required => 1,
);

=head2 C<< contextId >>

The ID of the context.

=cut

has 'contextId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< type >>

=cut

has 'type' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
