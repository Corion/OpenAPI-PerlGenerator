package JIRA::API::UserBean 0.01;
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

JIRA::API::UserBean -

=head1 SYNOPSIS

  my $obj = JIRA::API::UserBean->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< accountId >>

The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.

=cut

has 'accountId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< active >>

Whether the user is active.

=cut

has 'active' => (
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

=head2 C<< key >>

This property is deprecated in favor of `accountId` because of privacy changes. See the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.  
The key of the user.

=cut

has 'key' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

This property is deprecated in favor of `accountId` because of privacy changes. See the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.  
The username of the user.

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


1;
