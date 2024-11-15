package JIRA::API::CreateWorkflowDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::CreateWorkflowDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::CreateWorkflowDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< description >>

The description of the workflow. The maximum length is 1000 characters.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the workflow. The name must be unique. The maximum length is 255 characters. Characters can be separated by a whitespace but the name cannot start or end with a whitespace.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< statuses >>

The statuses of the workflow. Any status that does not include a transition is added to the workflow without a transition.

=cut

has 'statuses' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
    required => 1,
);

=head2 C<< transitions >>

The transitions of the workflow. For the request to be valid, these transitions must:

 *  include one *initial* transition.
 *  not use the same name for a *global* and *directed* transition.
 *  have a unique name for each *global* transition.
 *  have a unique 'to' status for each *global* transition.
 *  have unique names for each transition from a status.
 *  not have a 'from' status on *initial* and *global* transitions.
 *  have a 'from' status on *directed* transitions.

All the transition statuses must be included in `statuses`.

=cut

has 'transitions' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
    required => 1,
);


1;
