package JIRA::API::JqlQueryOrderByClause 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::JqlQueryOrderByClause -

=head1 SYNOPSIS

  my $obj = JIRA::API::JqlQueryOrderByClause->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< fields >>

The list of order-by clause fields and their ordering directives.

=cut

has 'fields' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
    required => 1,
);


1;
