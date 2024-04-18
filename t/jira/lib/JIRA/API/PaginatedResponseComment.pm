package JIRA::API::PaginatedResponseComment 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::PaginatedResponseComment -

=head1 SYNOPSIS

  my $obj = JIRA::API::PaginatedResponseComment->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< maxResults >>

=cut

has 'maxResults' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< results >>

=cut

has 'results' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< startAt >>

=cut

has 'startAt' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< total >>

=cut

has 'total' => (
    is       => 'ro',
    isa      => Int,
);


1;
