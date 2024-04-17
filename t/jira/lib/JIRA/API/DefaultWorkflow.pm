package JIRA::API::DefaultWorkflow 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::DefaultWorkflow -

=head1 SYNOPSIS

  my $obj = JIRA::API::DefaultWorkflow->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< updateDraftIfNeeded >>

Whether a draft workflow scheme is created or updated when updating an active workflow scheme. The draft is updated with the new default workflow. Defaults to `false`.

=cut

has 'updateDraftIfNeeded' => (
    is       => 'ro',
);

=head2 C<< workflow >>

The name of the workflow to set as the default workflow.

=cut

has 'workflow' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
