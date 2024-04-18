package JIRA::API::WorkflowTransitionRulesUpdate 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::WorkflowTransitionRulesUpdate -

=head1 SYNOPSIS

  my $obj = JIRA::API::WorkflowTransitionRulesUpdate->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< workflows >>

The list of workflows with transition rules to update.

=cut

has 'workflows' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
    required => 1,
);


1;
