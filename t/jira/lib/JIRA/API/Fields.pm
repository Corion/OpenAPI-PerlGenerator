package JIRA::API::Fields 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::Fields -

=head1 SYNOPSIS

  my $obj = JIRA::API::Fields->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< assignee >>

The assignee of the linked issue.

=cut

has 'assignee' => (
    is       => 'ro',
);

=head2 C<< issueType >>

The type of the linked issue.

=cut

has 'issueType' => (
    is       => 'ro',
);

=head2 C<< issuetype >>

Details about an issue type.

=cut

has 'issuetype' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< priority >>

The priority of the linked issue.

=cut

has 'priority' => (
    is       => 'ro',
);

=head2 C<< status >>

The status of the linked issue.

=cut

has 'status' => (
    is       => 'ro',
);

=head2 C<< summary >>

The summary description of the linked issue.

=cut

has 'summary' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< timetracking >>

The time tracking of the linked issue.

=cut

has 'timetracking' => (
    is       => 'ro',
);


1;
