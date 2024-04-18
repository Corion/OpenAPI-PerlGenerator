package JIRA::API::IssueTypeWithStatus 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::IssueTypeWithStatus -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssueTypeWithStatus->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< id >>

The ID of the issue type.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< name >>

The name of the issue type.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< self >>

The URL of the issue type's status details.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< statuses >>

List of status details for the issue type.

=cut

has 'statuses' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
    required => 1,
);

=head2 C<< subtask >>

Whether this issue type represents subtasks.

=cut

has 'subtask' => (
    is       => 'ro',
    required => 1,
);


1;
