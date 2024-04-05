package JIRA::API::Webhook 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::Webhook -

=head1 SYNOPSIS

  my $obj = JIRA::API::Webhook->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< events >>

The Jira events that trigger the webhook.

=cut

has 'events' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
    required => 1,
);

=head2 C<< expirationDate >>

The date after which the webhook is no longer sent. Use [Extend webhook life](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-webhooks/#api-rest-api-3-webhook-refresh-put) to extend the date.

=cut

has 'expirationDate' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< fieldIdsFilter >>

A list of field IDs. When the issue changelog contains any of the fields, the webhook `jira:issue_updated` is sent. If this parameter is not present, the app is notified about all field updates.

=cut

has 'fieldIdsFilter' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);

=head2 C<< id >>

The ID of the webhook.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< issuePropertyKeysFilter >>

A list of issue property keys. A change of those issue properties triggers the `issue_property_set` or `issue_property_deleted` webhooks. If this parameter is not present, the app is notified about all issue property updates.

=cut

has 'issuePropertyKeysFilter' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);

=head2 C<< jqlFilter >>

The JQL filter that specifies which issues the webhook is sent for.

=cut

has 'jqlFilter' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
