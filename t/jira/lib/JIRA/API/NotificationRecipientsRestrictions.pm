package JIRA::API::NotificationRecipientsRestrictions 0.01;
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

JIRA::API::NotificationRecipientsRestrictions -

=head1 SYNOPSIS

  my $obj = JIRA::API::NotificationRecipientsRestrictions->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< groupIds >>

List of groupId memberships required to receive the notification.

=cut

has 'groupIds' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);

=head2 C<< groups >>

List of group memberships required to receive the notification.

=cut

has 'groups' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< permissions >>

List of permissions required to receive the notification.

=cut

has 'permissions' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);


1;
