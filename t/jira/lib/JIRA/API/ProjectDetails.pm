package JIRA::API::ProjectDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::ProjectDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::ProjectDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< avatarUrls >>

The URLs of the project's avatars.

=cut

has 'avatarUrls' => (
    is       => 'ro',
);

=head2 C<< id >>

The ID of the project.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
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

=head2 C<< projectCategory >>

The category the project belongs to.

=cut

has 'projectCategory' => (
    is       => 'ro',
);

=head2 C<< projectTypeKey >>

The [project type](https://confluence.atlassian.com/x/GwiiLQ#Jiraapplicationsoverview-Productfeaturesandprojecttypes) of the project.

=cut

has 'projectTypeKey' => (
    is       => 'ro',
    isa      => Enum[
        "software",
        "service_desk",
        "business",
    ],
);

=head2 C<< self >>

The URL of the project details.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< simplified >>

Whether or not the project is simplified.

=cut

has 'simplified' => (
    is       => 'ro',
);


1;
