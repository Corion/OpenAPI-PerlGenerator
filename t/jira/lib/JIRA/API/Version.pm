package JIRA::API::Version 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::Version -

=head1 SYNOPSIS

  my $obj = JIRA::API::Version->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< archived >>

Indicates that the version is archived. Optional when creating or updating a version.

=cut

has 'archived' => (
    is       => 'ro',
);

=head2 C<< description >>

The description of the version. Optional when creating or updating a version.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< expand >>

Use [expand](em>#expansion) to include additional information about version in the response. This parameter accepts a comma-separated list. Expand options include:

 *  `operations` Returns the list of operations available for this version.
 *  `issuesstatus` Returns the count of issues in this version for each of the status categories *to do*, *in progress*, *done*, and *unmapped*. The *unmapped* property contains a count of issues with a status other than *to do*, *in progress*, and *done*.

Optional for create and update.

=cut

has 'expand' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< id >>

The ID of the version.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< issuesStatusForFixVersion >>

If the expand option `issuesstatus` is used, returns the count of issues in this version for each of the status categories *to do*, *in progress*, *done*, and *unmapped*. The *unmapped* property contains a count of issues with a status other than *to do*, *in progress*, and *done*.

=cut

has 'issuesStatusForFixVersion' => (
    is       => 'ro',
);

=head2 C<< moveUnfixedIssuesTo >>

The URL of the self link to the version to which all unfixed issues are moved when a version is released. Not applicable when creating a version. Optional when updating a version.

=cut

has 'moveUnfixedIssuesTo' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The unique name of the version. Required when creating a version. Optional when updating a version. The maximum length is 255 characters.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< operations >>

If the expand option `operations` is used, returns the list of operations available for this version.

=cut

has 'operations' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< overdue >>

Indicates that the version is overdue.

=cut

has 'overdue' => (
    is       => 'ro',
);

=head2 C<< project >>

Deprecated. Use `projectId`.

=cut

has 'project' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< projectId >>

The ID of the project to which this version is attached. Required when creating a version. Not applicable when updating a version.

=cut

has 'projectId' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< releaseDate >>

The release date of the version. Expressed in ISO 8601 format (yyyy-mm-dd). Optional when creating or updating a version.

=cut

has 'releaseDate' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< released >>

Indicates that the version is released. If the version is released a request to release again is ignored. Not applicable when creating a version. Optional when updating a version.

=cut

has 'released' => (
    is       => 'ro',
);

=head2 C<< self >>

The URL of the version.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< startDate >>

The start date of the version. Expressed in ISO 8601 format (yyyy-mm-dd). Optional when creating or updating a version.

=cut

has 'startDate' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< userReleaseDate >>

The date on which work on this version is expected to finish, expressed in the instance's *Day/Month/Year Format* date format.

=cut

has 'userReleaseDate' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< userStartDate >>

The date on which work on this version is expected to start, expressed in the instance's *Day/Month/Year Format* date format.

=cut

has 'userStartDate' => (
    is       => 'ro',
    isa      => Str,
);


1;