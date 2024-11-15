package JIRA::API::JqlQueriesToSanitize 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::JqlQueriesToSanitize -

=head1 SYNOPSIS

  my $obj = JIRA::API::JqlQueriesToSanitize->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< queries >>

The list of JQL queries to sanitize. Must contain unique values. Maximum of 20 queries.

=cut

has 'queries' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
    required => 1,
);


1;
