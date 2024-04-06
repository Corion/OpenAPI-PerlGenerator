package JIRA::API::VersionUnresolvedIssuesCount 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::VersionUnresolvedIssuesCount -

=head1 SYNOPSIS

  my $obj = JIRA::API::VersionUnresolvedIssuesCount->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< issuesCount >>

Count of issues.

=cut

has 'issuesCount' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< issuesUnresolvedCount >>

Count of unresolved issues.

=cut

has 'issuesUnresolvedCount' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< self >>

The URL of these count details.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);


1;