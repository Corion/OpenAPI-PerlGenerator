package JIRA::API::OrderOfIssueTypes 0.01;
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

JIRA::API::OrderOfIssueTypes -

=head1 SYNOPSIS

  my $obj = JIRA::API::OrderOfIssueTypes->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< after >>

The ID of the issue type to place the moved issue types after. Required if `position` isn't provided.

=cut

has 'after' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< issueTypeIds >>

A list of the issue type IDs to move. The order of the issue type IDs in the list is the order they are given after the move.

=cut

has 'issueTypeIds' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
    required => 1,
);

=head2 C<< position >>

The position the issue types should be moved to. Required if `after` isn't provided.

=cut

has 'position' => (
    is       => 'ro',
    isa      => Enum[
        "First",
        "Last",
    ],
);


1;
