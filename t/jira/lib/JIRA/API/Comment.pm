package JIRA::API::Comment 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::Comment -

=head1 SYNOPSIS

  my $obj = JIRA::API::Comment->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< author >>

The ID of the user who created the comment.

=cut

has 'author' => (
    is       => 'ro',
);

=head2 C<< body >>

The comment text in [Atlassian Document Format](https://developer.atlassian.com/cloud/jira/platform/apis/document/structure/).

=cut

has 'body' => (
    is       => 'ro',
);

=head2 C<< created >>

The date and time at which the comment was created.

=cut

has 'created' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< id >>

The ID of the comment.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< jsdAuthorCanSeeRequest >>

Whether the comment was added from an email sent by a person who is not part of the issue. See [Allow external emails to be added as comments on issues](https://support.atlassian.com/jira-service-management-cloud/docs/allow-external-emails-to-be-added-as-comments-on-issues/)for information on setting up this feature.

=cut

has 'jsdAuthorCanSeeRequest' => (
    is       => 'ro',
);

=head2 C<< jsdPublic >>

Whether the comment is visible in Jira Service Desk. Defaults to true when comments are created in the Jira Cloud Platform. This includes when the site doesn't use Jira Service Desk or the project isn't a Jira Service Desk project and, therefore, there is no Jira Service Desk for the issue to be visible on. To create a comment with its visibility in Jira Service Desk set to false, use the Jira Service Desk REST API [Create request comment](https://developer.atlassian.com/cloud/jira/service-desk/rest/#api-rest-servicedeskapi-request-issueIdOrKey-comment-post) operation.

=cut

has 'jsdPublic' => (
    is       => 'ro',
);

=head2 C<< properties >>

A list of comment properties. Optional on create and update.

=cut

has 'properties' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< renderedBody >>

The rendered version of the comment.

=cut

has 'renderedBody' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< self >>

The URL of the comment.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< updateAuthor >>

The ID of the user who updated the comment last.

=cut

has 'updateAuthor' => (
    is       => 'ro',
);

=head2 C<< updated >>

The date and time at which the comment was updated last.

=cut

has 'updated' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< visibility >>

The group or role to which this comment is visible. Optional on create and update.

=cut

has 'visibility' => (
    is       => 'ro',
);


1;
