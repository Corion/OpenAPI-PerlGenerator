package JIRA::API::Votes 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::Votes -

=head1 SYNOPSIS

  my $obj = JIRA::API::Votes->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< hasVoted >>

Whether the user making this request has voted on the issue.

=cut

has 'hasVoted' => (
    is       => 'ro',
);

=head2 C<< self >>

The URL of these issue vote details.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< voters >>

List of the users who have voted on this issue. An empty list is returned when the calling user doesn't have the *View voters and watchers* project permission.

=cut

has 'voters' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< votes >>

The number of votes on the issue.

=cut

has 'votes' => (
    is       => 'ro',
    isa      => Int,
);


1;
