package JIRA::API::IssueLink 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::IssueLink -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssueLink->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< id >>

The ID of the issue link.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< inwardIssue >>

Provides details about the linked issue. If presenting this link in a user interface, use the `inward` field of the issue link type to label the link.

=cut

has 'inwardIssue' => (
    is       => 'ro',
    required => 1,
);

=head2 C<< outwardIssue >>

Provides details about the linked issue. If presenting this link in a user interface, use the `outward` field of the issue link type to label the link.

=cut

has 'outwardIssue' => (
    is       => 'ro',
    required => 1,
);

=head2 C<< self >>

The URL of the issue link.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< type >>

The type of link between the issues.

=cut

has 'type' => (
    is       => 'ro',
    required => 1,
);


1;