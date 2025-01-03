package JIRA::API::IssueUpdateDetails 0.01;
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

JIRA::API::IssueUpdateDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssueUpdateDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< fields >>

List of issue screen fields to update, specifying the sub-field to update and its value for each field. This field provides a straightforward option when setting a sub-field. When multiple sub-fields or other operations are required, use `update`. Fields included in here cannot be included in `update`.

=cut

has 'fields' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< historyMetadata >>

Additional issue history details.

=cut

has 'historyMetadata' => (
    is       => 'ro',
);

=head2 C<< properties >>

Details of issue properties to be add or update.

=cut

has 'properties' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< transition >>

Details of a transition. Required when performing a transition, optional when creating or editing an issue.

=cut

has 'transition' => (
    is       => 'ro',
);

=head2 C<< update >>

A Map containing the field field name and a list of operations to perform on the issue screen field. Note that fields included in here cannot be included in `fields`.

=cut

has 'update' => (
    is       => 'ro',
    isa      => HashRef,
);


1;
