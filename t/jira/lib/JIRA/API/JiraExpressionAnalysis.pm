package JIRA::API::JiraExpressionAnalysis 0.01;
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

=head2 C<< complexity >>

Details about the complexity of the analysed Jira expression.

=cut

has 'complexity' => (
    is       => 'ro',
    isa      => Object,
);

=head2 C<< errors >>

A list of validation errors. Not included if the expression is valid.

=cut

has 'errors' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< expression >>

The analysed expression.

=cut

has 'expression' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< type >>

EXPERIMENTAL. The inferred type of the expression.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< valid >>

Whether the expression is valid and the interpreter will evaluate it. Note that the expression may fail at runtime (for example, if it executes too many expensive operations).

=cut

has 'valid' => (
    is       => 'ro',
    required => 1,
);


1;
