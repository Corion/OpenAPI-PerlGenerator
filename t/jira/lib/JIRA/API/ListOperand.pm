package JIRA::API::ListOperand 0.01;
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

=head2 C<< encodedOperand >>

Encoded operand, which can be used directly in a JQL query.

=cut

has 'encodedOperand' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< values >>

The list of operand values.

=cut

has 'values' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
    required => 1,
);


1;
