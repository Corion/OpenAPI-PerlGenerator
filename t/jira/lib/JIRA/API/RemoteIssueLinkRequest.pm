package JIRA::API::RemoteIssueLinkRequest 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

use namespace::clean;

=encoding utf8

=head1 NAME

JIRA::API::RemoteIssueLinkRequest -

=head1 SYNOPSIS

  my $obj = JIRA::API::RemoteIssueLinkRequest->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< application >>

Details of the remote application the linked item is in. For example, trello.

=cut

has 'application' => (
    is       => 'ro',
);

=head2 C<< globalId >>

An identifier for the remote item in the remote system. For example, the global ID for a remote item in Confluence would consist of the app ID and page ID, like this: `appId=456&pageId=123`.

Setting this field enables the remote issue link details to be updated or deleted using remote system and item details as the record identifier, rather than using the record's Jira ID.

The maximum length is 255 characters.

=cut

has 'globalId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< object >>

Details of the item linked to.

=cut

has 'object' => (
    is       => 'ro',
    required => 1,
);

=head2 C<< relationship >>

Description of the relationship between the issue and the linked item. If not set, the relationship description "links to" is used in Jira.

=cut

has 'relationship' => (
    is       => 'ro',
    isa      => Str,
);


1;
