package JIRA::API::PageOfDashboards 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::PageOfDashboards -

=head1 SYNOPSIS

  my $obj = JIRA::API::PageOfDashboards->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< dashboards >>

List of dashboards.

=cut

has 'dashboards' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< maxResults >>

The maximum number of results that could be on the page.

=cut

has 'maxResults' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< next >>

The URL of the next page of results, if any.

=cut

has 'next' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< prev >>

The URL of the previous page of results, if any.

=cut

has 'prev' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< startAt >>

The index of the first item returned on the page.

=cut

has 'startAt' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< total >>

The number of results on the page.

=cut

has 'total' => (
    is       => 'ro',
    isa      => Int,
);


1;
