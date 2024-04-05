package JIRA::API::UserPickerUser 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::UserPickerUser -

=head1 SYNOPSIS

  my $obj = JIRA::API::UserPickerUser->new();
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

=head2 C<< avatarUrl >>

The avatar URL of the user.

=cut

has 'avatarUrl' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< displayName >>

The display name of the user. Depending on the user’s privacy setting, this may be returned as null.

=cut

has 'displayName' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< html >>

The display name, email address, and key of the user with the matched query string highlighted with the HTML bold tag.

=cut

has 'html' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< key >>

This property is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.

=cut

has 'key' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

This property is no longer available . See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);


1;
