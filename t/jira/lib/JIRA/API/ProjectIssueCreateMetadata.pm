package JIRA::API::ProjectIssueCreateMetadata 0.01;
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

JIRA::API::ProjectIssueCreateMetadata -

=head1 SYNOPSIS

  my $obj = JIRA::API::ProjectIssueCreateMetadata->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< avatarUrls >>

List of the project's avatars, returning the avatar size and associated URL.

=cut

has 'avatarUrls' => (
    is       => 'ro',
);

=head2 C<< expand >>

Expand options that include additional project issue create metadata details in the response.

=cut

has 'expand' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< id >>

The ID of the project.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< issuetypes >>

List of the issue types supported by the project.

=cut

has 'issuetypes' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< key >>

The key of the project.

=cut

has 'key' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the project.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< self >>

The URL of the project.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);


1;
