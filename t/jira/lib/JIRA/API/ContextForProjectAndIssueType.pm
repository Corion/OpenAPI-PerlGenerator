package JIRA::API::ContextForProjectAndIssueType 0.01;
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

JIRA::API::ContextForProjectAndIssueType -

=head1 SYNOPSIS

  my $obj = JIRA::API::ContextForProjectAndIssueType->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< contextId >>

The ID of the custom field context.

=cut

has 'contextId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< issueTypeId >>

The ID of the issue type.

=cut

has 'issueTypeId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< projectId >>

The ID of the project.

=cut

has 'projectId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
