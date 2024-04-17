package JIRA::API::PublishDraftWorkflowScheme 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::PublishDraftWorkflowScheme -

=head1 SYNOPSIS

  my $obj = JIRA::API::PublishDraftWorkflowScheme->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< statusMappings >>

Mappings of statuses to new statuses for issue types.

=cut

has 'statusMappings' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);


1;
