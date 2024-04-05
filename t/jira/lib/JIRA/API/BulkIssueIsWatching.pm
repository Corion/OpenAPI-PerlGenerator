package JIRA::API::BulkIssueIsWatching 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::BulkIssueIsWatching -

=head1 SYNOPSIS

  my $obj = JIRA::API::BulkIssueIsWatching->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< issuesIsWatching >>

The map of issue ID to boolean watch status.

=cut

has 'issuesIsWatching' => (
    is       => 'ro',
    isa      => Object,
);


1;
