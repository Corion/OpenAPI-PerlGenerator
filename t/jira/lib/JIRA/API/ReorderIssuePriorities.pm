package JIRA::API::ReorderIssuePriorities 0.01;
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

JIRA::API::ReorderIssuePriorities -

=head1 SYNOPSIS

  my $obj = JIRA::API::ReorderIssuePriorities->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< after >>

The ID of the priority. Required if `position` isn't provided.

=cut

has 'after' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< ids >>

The list of issue IDs to be reordered. Cannot contain duplicates nor after ID.

=cut

has 'ids' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
    required => 1,
);

=head2 C<< position >>

The position for issue priorities to be moved to. Required if `after` isn't provided.

=cut

has 'position' => (
    is       => 'ro',
    isa      => Str,
);


1;
