package JIRA::API::PublishedWorkflowId 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::PublishedWorkflowId -

=head1 SYNOPSIS

  my $obj = JIRA::API::PublishedWorkflowId->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< entityId >>

The entity ID of the workflow.

=cut

has 'entityId' => (
    is       => 'ro',
    isa      => Str,
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
