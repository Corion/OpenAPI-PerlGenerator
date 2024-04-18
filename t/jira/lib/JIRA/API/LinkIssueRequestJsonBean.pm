package JIRA::API::LinkIssueRequestJsonBean 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::LinkIssueRequestJsonBean -

=head1 SYNOPSIS

  my $obj = JIRA::API::LinkIssueRequestJsonBean->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< comment >>

A comment.

=cut

has 'comment' => (
    is       => 'ro',
    isa      => Object,
);

=head2 C<< inwardIssue >>

The ID or key of a linked issue.

=cut

has 'inwardIssue' => (
    is       => 'ro',
    isa      => Object,
    required => 1,
);

=head2 C<< outwardIssue >>

The ID or key of a linked issue.

=cut

has 'outwardIssue' => (
    is       => 'ro',
    isa      => Object,
    required => 1,
);

=head2 C<< type >>

This object is used as follows:

 *  In the [ issueLink](#api-rest-api-3-issueLink-post) resource it defines and reports on the type of link between the issues. Find a list of issue link types with [Get issue link types](#api-rest-api-3-issueLinkType-get).
 *  In the [ issueLinkType](#api-rest-api-3-issueLinkType-post) resource it defines and reports on issue link types.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Object,
    required => 1,
);


1;
