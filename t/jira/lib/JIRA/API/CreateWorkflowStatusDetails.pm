package JIRA::API::CreateWorkflowStatusDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::CreateWorkflowStatusDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::CreateWorkflowStatusDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< id >>

The ID of the status.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< properties >>

The properties of the status.

=cut

has 'properties' => (
    is       => 'ro',
    isa      => HashRef,
);


1;
