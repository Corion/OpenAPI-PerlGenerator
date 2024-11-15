package JIRA::API::RoleActor 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::RoleActor -

=head1 SYNOPSIS

  my $obj = JIRA::API::RoleActor->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< actorGroup >>

=cut

has 'actorGroup' => (
    is       => 'ro',
);

=head2 C<< actorUser >>

=cut

has 'actorUser' => (
    is       => 'ro',
);

=head2 C<< avatarUrl >>

The avatar of the role actor.

=cut

has 'avatarUrl' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< displayName >>

The display name of the role actor. For users, depending on the user’s privacy setting, this may return an alternative value for the user's name.

=cut

has 'displayName' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< id >>

The ID of the role actor.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< name >>

This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< type >>

The type of role actor.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Enum[
        "atlassian-group-role-actor",
        "atlassian-user-role-actor",
    ],
);


1;
