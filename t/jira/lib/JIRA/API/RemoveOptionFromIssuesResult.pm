package JIRA::API::RemoveOptionFromIssuesResult 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::RemoveOptionFromIssuesResult -

=head1 SYNOPSIS

  my $obj = JIRA::API::RemoveOptionFromIssuesResult->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< errors >>

A collection of errors related to unchanged issues. The collection size is limited, which means not all errors may be returned.

=cut

has 'errors' => (
    is       => 'ro',
);

=head2 C<< modifiedIssues >>

The IDs of the modified issues.

=cut

has 'modifiedIssues' => (
    is       => 'ro',
    isa      => ArrayRef[Int],
);

=head2 C<< unmodifiedIssues >>

The IDs of the unchanged issues, those issues where errors prevent modification.

=cut

has 'unmodifiedIssues' => (
    is       => 'ro',
    isa      => ArrayRef[Int],
);


1;
