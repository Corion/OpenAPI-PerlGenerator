package JIRA::API::OrderOfCustomFieldOptions 0.01;
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

JIRA::API::OrderOfCustomFieldOptions -

=head1 SYNOPSIS

  my $obj = JIRA::API::OrderOfCustomFieldOptions->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< after >>

The ID of the custom field option or cascading option to place the moved options after. Required if `position` isn't provided.

=cut

has 'after' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< customFieldOptionIds >>

A list of IDs of custom field options to move. The order of the custom field option IDs in the list is the order they are given after the move. The list must contain custom field options or cascading options, but not both.

=cut

has 'customFieldOptionIds' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
    required => 1,
);

=head2 C<< position >>

The position the custom field options should be moved to. Required if `after` isn't provided.

=cut

has 'position' => (
    is       => 'ro',
    isa      => Enum[
        "First",
        "Last",
    ],
);


1;
