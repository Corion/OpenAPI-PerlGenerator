package JIRA::API::JqlQuery 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::JqlQuery -

=head1 SYNOPSIS

  my $obj = JIRA::API::JqlQuery->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< orderBy >>

Details of the order-by JQL clause.

=cut

has 'orderBy' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< where >>

A JQL query clause.

=cut

has 'where' => (
    is       => 'ro',
    isa      => HashRef,
);


1;
