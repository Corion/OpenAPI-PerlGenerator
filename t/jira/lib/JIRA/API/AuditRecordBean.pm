package JIRA::API::AuditRecordBean 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::AuditRecordBean -

=head1 SYNOPSIS

  my $obj = JIRA::API::AuditRecordBean->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< associatedItems >>

The list of items associated with the changed record.

=cut

has 'associatedItems' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< authorKey >>

Deprecated, use `authorAccountId` instead. The key of the user who created the audit record.

=cut

has 'authorKey' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< category >>

The category of the audit record. For a list of these categories, see the help article [Auditing in Jira applications](https://confluence.atlassian.com/x/noXKM).

=cut

has 'category' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< changedValues >>

The list of values changed in the record event.

=cut

has 'changedValues' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< created >>

The date and time on which the audit record was created.

=cut

has 'created' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< description >>

The description of the audit record.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< eventSource >>

The event the audit record originated from.

=cut

has 'eventSource' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< id >>

The ID of the audit record.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< objectItem >>

Details of an item associated with the changed record.

=cut

has 'objectItem' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< remoteAddress >>

The URL of the computer where the creation of the audit record was initiated.

=cut

has 'remoteAddress' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< summary >>

The summary of the audit record.

=cut

has 'summary' => (
    is       => 'ro',
    isa      => Str,
);


1;
