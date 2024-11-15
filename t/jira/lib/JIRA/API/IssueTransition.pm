package JIRA::API::IssueTransition 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::IssueTransition -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssueTransition->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< expand >>

Expand options that include additional transition details in the response.

=cut

has 'expand' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< fields >>

Details of the fields associated with the issue transition screen. Use this information to populate `fields` and `update` in a transition request.

=cut

has 'fields' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< hasScreen >>

Whether there is a screen associated with the issue transition.

=cut

has 'hasScreen' => (
    is       => 'ro',
);

=head2 C<< id >>

The ID of the issue transition. Required when specifying a transition to undertake.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< isAvailable >>

Whether the transition is available to be performed.

=cut

has 'isAvailable' => (
    is       => 'ro',
);

=head2 C<< isConditional >>

Whether the issue has to meet criteria before the issue transition is applied.

=cut

has 'isConditional' => (
    is       => 'ro',
);

=head2 C<< isGlobal >>

Whether the issue transition is global, that is, the transition is applied to issues regardless of their status.

=cut

has 'isGlobal' => (
    is       => 'ro',
);

=head2 C<< isInitial >>

Whether this is the initial issue transition for the workflow.

=cut

has 'isInitial' => (
    is       => 'ro',
);

=head2 C<< looped >>

=cut

has 'looped' => (
    is       => 'ro',
);

=head2 C<< name >>

The name of the issue transition.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< to >>

Details of the issue status after the transition.

=cut

has 'to' => (
    is       => 'ro',
);


1;
