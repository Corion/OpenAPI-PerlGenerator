package JIRA::API::ProjectIssueTypeHierarchy 0.01;
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

JIRA::API::ProjectIssueTypeHierarchy -

=head1 SYNOPSIS

  my $obj = JIRA::API::ProjectIssueTypeHierarchy->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< hierarchy >>

Details of an issue type hierarchy level.

=cut

has 'hierarchy' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< projectId >>

The ID of the project.

=cut

has 'projectId' => (
    is       => 'ro',
    isa      => Int,
);


1;
