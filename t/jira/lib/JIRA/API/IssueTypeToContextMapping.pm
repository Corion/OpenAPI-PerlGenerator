package JIRA::API::IssueTypeToContextMapping 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::IssueTypeToContextMapping -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssueTypeToContextMapping->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< contextId >>

The ID of the context.

=cut

has 'contextId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< isAnyIssueType >>

Whether the context is mapped to any issue type.

=cut

has 'isAnyIssueType' => (
    is       => 'ro',
);

=head2 C<< issueTypeId >>

The ID of the issue type.

=cut

has 'issueTypeId' => (
    is       => 'ro',
    isa      => Str,
);


1;
