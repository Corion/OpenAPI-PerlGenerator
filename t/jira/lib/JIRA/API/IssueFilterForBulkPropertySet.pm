package JIRA::API::IssueFilterForBulkPropertySet 0.01;
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

JIRA::API::IssueFilterForBulkPropertySet -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssueFilterForBulkPropertySet->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< currentValue >>

The value of properties to perform the bulk operation on.

=cut

has 'currentValue' => (
    is       => 'ro',
);

=head2 C<< entityIds >>

List of issues to perform the bulk operation on.

=cut

has 'entityIds' => (
    is       => 'ro',
    isa      => ArrayRef[Int],
);

=head2 C<< hasProperty >>

Whether the bulk operation occurs only when the property is present on or absent from an issue.

=cut

has 'hasProperty' => (
    is       => 'ro',
);


1;
