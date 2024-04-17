package JIRA::API::JqlQueryOrderByClauseElement 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::JqlQueryOrderByClauseElement -

=head1 SYNOPSIS

  my $obj = JIRA::API::JqlQueryOrderByClauseElement->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< direction >>

The direction in which to order the results.

=cut

has 'direction' => (
    is       => 'ro',
    isa      => Enum[
        "asc",
        "desc",
    ],
);

=head2 C<< field >>

A field used in a JQL query. See [Advanced searching - fields reference](https://confluence.atlassian.com/x/dAiiLQ) for more information about fields in JQL queries.

=cut

has 'field' => (
    is       => 'ro',
    isa      => Object,
    required => 1,
);


1;
