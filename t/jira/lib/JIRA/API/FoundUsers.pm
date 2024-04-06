package JIRA::API::FoundUsers 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

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
    isa      => ArrayRef[Object],
);


1;