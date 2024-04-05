package JIRA::API::IssueTypeIssueCreateMetadata 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::IssueTypeIssueCreateMetadata -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssueTypeIssueCreateMetadata->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< avatarId >>

The ID of the issue type's avatar.

=cut

has 'avatarId' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< description >>

The description of the issue type.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< entityId >>

Unique ID for next-gen projects.

=cut

has 'entityId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< expand >>

Expand options that include additional issue type metadata details in the response.

=cut

has 'expand' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< fields >>

List of the fields available when creating an issue for the issue type.

=cut

has 'fields' => (
    is       => 'ro',
    isa      => Object,
);

=head2 C<< hierarchyLevel >>

Hierarchy level of the issue type.

=cut

has 'hierarchyLevel' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< iconUrl >>

The URL of the issue type's avatar.

=cut

has 'iconUrl' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< id >>

The ID of the issue type.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the issue type.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< scope >>

Details of the next-gen projects the issue type is available in.

=cut

has 'scope' => (
    is       => 'ro',
);

=head2 C<< self >>

The URL of these issue type details.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< subtask >>

Whether this issue type is used to create subtasks.

=cut

has 'subtask' => (
    is       => 'ro',
);


1;
