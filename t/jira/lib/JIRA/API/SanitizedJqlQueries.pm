package JIRA::API::SanitizedJqlQueries 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::SanitizedJqlQueries -

=head1 SYNOPSIS

  my $obj = JIRA::API::SanitizedJqlQueries->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< queries >>

The list of sanitized JQL queries.

=cut

has 'queries' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);


1;
