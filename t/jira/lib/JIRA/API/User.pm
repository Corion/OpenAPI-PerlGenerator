package JIRA::API::User 0.01;
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

JIRA::API::User -

=head1 SYNOPSIS

  my $obj = JIRA::API::User->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< accountId >>

The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*. Required in requests.

=cut

has 'accountId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< accountType >>

The user account type. Can take the following values:

 *  `atlassian` regular Atlassian user account
 *  `app` system account used for Connect applications and OAuth to represent external systems
 *  `customer` Jira Service Desk account representing an external service desk

=cut

has 'accountType' => (
    is       => 'ro',
    isa      => Enum[
        "atlassian",
        "app",
        "customer",
        "unknown",
    ],
);

=head2 C<< active >>

Whether the user is active.

=cut

has 'active' => (
    is       => 'ro',
);

=head2 C<< applicationRoles >>

The application roles the user is assigned to.

=cut

has 'applicationRoles' => (
    is       => 'ro',
);

=head2 C<< avatarUrls >>

The avatars of the user.

=cut

has 'avatarUrls' => (
    is       => 'ro',
);

=head2 C<< displayName >>

The display name of the user. Depending on the user’s privacy setting, this may return an alternative value.

=cut

has 'displayName' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< emailAddress >>

The email address of the user. Depending on the user’s privacy setting, this may be returned as null.

=cut

has 'emailAddress' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< expand >>

Expand options that include additional user details in the response.

=cut

has 'expand' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< groups >>

The groups that the user belongs to.

=cut

has 'groups' => (
    is       => 'ro',
);

=head2 C<< key >>

This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.

=cut

has 'key' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< locale >>

The locale of the user. Depending on the user’s privacy setting, this may be returned as null.

=cut

has 'locale' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< self >>

The URL of the user.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< timeZone >>

The time zone specified in the user's profile. Depending on the user’s privacy setting, this may be returned as null.

=cut

has 'timeZone' => (
    is       => 'ro',
    isa      => Str,
);


1;
