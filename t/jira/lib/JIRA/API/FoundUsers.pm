package JIRA::API::FoundUsers 0.01;
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

JIRA::API::FoundUsers -

=head1 SYNOPSIS

  my $obj = JIRA::API::FoundUsers->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< header >>

Header text indicating the number of users in the response and the total number of users found in the search.

=cut

has 'header' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< total >>

The total number of users found in the search.

=cut

has 'total' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< users >>

=cut

has 'users' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);


1;
