package JIRA::API::ConvertedJQLQueries 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

use namespace::clean;

=encoding utf8

=head1 NAME

JIRA::API::ConvertedJQLQueries -

=head1 SYNOPSIS

  my $obj = JIRA::API::ConvertedJQLQueries->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< queriesWithUnknownUsers >>

List of queries containing user information that could not be mapped to an existing user

=cut

has 'queriesWithUnknownUsers' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< queryStrings >>

The list of converted query strings with account IDs in place of user identifiers.

=cut

has 'queryStrings' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);


1;
