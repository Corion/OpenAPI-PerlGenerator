package JIRA::API::EventNotification 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::EventNotification -

=head1 SYNOPSIS

  my $obj = JIRA::API::EventNotification->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< emailAddress >>

The email address.

=cut

has 'emailAddress' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< expand >>

Expand options that include additional event notification details in the response.

=cut

has 'expand' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< field >>

The custom user or group field.

=cut

has 'field' => (
    is       => 'ro',
);

=head2 C<< group >>

The specified group.

=cut

has 'group' => (
    is       => 'ro',
);

=head2 C<< id >>

The ID of the notification.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< notificationType >>

Identifies the recipients of the notification.

=cut

has 'notificationType' => (
    is       => 'ro',
    isa      => Enum[
        "CurrentAssignee",
        "Reporter",
        "CurrentUser",
        "ProjectLead",
        "ComponentLead",
        "User",
        "Group",
        "ProjectRole",
        "EmailAddress",
        "AllWatchers",
        "UserCustomField",
        "GroupCustomField",
    ],
);

=head2 C<< parameter >>

As a group's name can change, use of `recipient` is recommended. The identifier associated with the `notificationType` value that defines the receiver of the notification, where the receiver isn't implied by `notificationType` value. So, when `notificationType` is:

 *  `User` The `parameter` is the user account ID.
 *  `Group` The `parameter` is the group name.
 *  `ProjectRole` The `parameter` is the project role ID.
 *  `UserCustomField` The `parameter` is the ID of the custom field.
 *  `GroupCustomField` The `parameter` is the ID of the custom field.

=cut

has 'parameter' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< projectRole >>

The specified project role.

=cut

has 'projectRole' => (
    is       => 'ro',
);

=head2 C<< recipient >>

The identifier associated with the `notificationType` value that defines the receiver of the notification, where the receiver isn't implied by the `notificationType` value. So, when `notificationType` is:

 *  `User`, `recipient` is the user account ID.
 *  `Group`, `recipient` is the group ID.
 *  `ProjectRole`, `recipient` is the project role ID.
 *  `UserCustomField`, `recipient` is the ID of the custom field.
 *  `GroupCustomField`, `recipient` is the ID of the custom field.

=cut

has 'recipient' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< user >>

The specified user.

=cut

has 'user' => (
    is       => 'ro',
);


1;
