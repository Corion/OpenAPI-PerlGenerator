package JIRA::API::FieldWasClause 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::FieldWasClause -

=head1 SYNOPSIS

  my $obj = JIRA::API::FieldWasClause->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< field >>

A field used in a JQL query. See [Advanced searching - fields reference](https://confluence.atlassian.com/x/dAiiLQ) for more information about fields in JQL queries.

=cut

has 'field' => (
    is       => 'ro',
    isa      => Object,
    required => 1,
);

=head2 C<< operand >>

Details of an operand in a JQL clause.

=cut

has 'operand' => (
    is       => 'ro',
    isa      => Object,
    required => 1,
);

=head2 C<< operator >>

The operator between the field and operand.

=cut

has 'operator' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< predicates >>

The list of time predicates.

=cut

has 'predicates' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
    required => 1,
);


1;
