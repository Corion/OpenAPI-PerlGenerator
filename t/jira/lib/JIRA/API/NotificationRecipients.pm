package JIRA::API::NotificationRecipients 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::NotificationRecipients -

=head1 SYNOPSIS

  my $obj = JIRA::API::NotificationRecipients->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< assignee >>

Whether the notification should be sent to the issue's assignees.

=cut

has 'assignee' => (
    is       => 'ro',
);

=head2 C<< groupIds >>

List of groupIds to receive the notification.

=cut

has 'groupIds' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);

=head2 C<< groups >>

List of groups to receive the notification.

=cut

has 'groups' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< reporter >>

Whether the notification should be sent to the issue's reporter.

=cut

has 'reporter' => (
    is       => 'ro',
);

=head2 C<< users >>

List of users to receive the notification.

=cut

has 'users' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< voters >>

Whether the notification should be sent to the issue's voters.

=cut

has 'voters' => (
    is       => 'ro',
);

=head2 C<< watchers >>

Whether the notification should be sent to the issue's watchers.

=cut

has 'watchers' => (
    is       => 'ro',
);


1;
