package JIRA::API::WorkflowId 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::WorkflowId -

=head1 SYNOPSIS

  my $obj = JIRA::API::WorkflowId->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< draft >>

Whether the workflow is in the draft state.

=cut

has 'draft' => (
    is       => 'ro',
    required => 1,
);

=head2 C<< name >>

The name of the workflow.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
