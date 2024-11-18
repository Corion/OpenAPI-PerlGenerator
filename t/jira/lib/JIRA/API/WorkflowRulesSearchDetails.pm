package JIRA::API::WorkflowRulesSearchDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

use namespace::clean;

=encoding utf8

=head1 NAME

JIRA::API::WorkflowRulesSearchDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::WorkflowRulesSearchDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< invalidRules >>

List of workflow rule IDs that do not belong to the workflow or can not be found.

=cut

has 'invalidRules' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);

=head2 C<< validRules >>

List of valid workflow transition rules.

=cut

has 'validRules' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< workflowEntityId >>

The workflow ID.

=cut

has 'workflowEntityId' => (
    is       => 'ro',
    isa      => Str,
);


1;
