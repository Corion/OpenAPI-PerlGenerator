package JIRA::API::WorkflowTransitionRulesUpdateErrors 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::WorkflowTransitionRulesUpdateErrors -

=head1 SYNOPSIS

  my $obj = JIRA::API::WorkflowTransitionRulesUpdateErrors->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< updateResults >>

A list of workflows.

=cut

has 'updateResults' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
    required => 1,
);


1;