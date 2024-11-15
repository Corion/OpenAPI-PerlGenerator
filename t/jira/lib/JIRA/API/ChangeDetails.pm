package JIRA::API::ChangeDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::ChangeDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::ChangeDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< field >>

The name of the field changed.

=cut

has 'field' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< fieldId >>

The ID of the field changed.

=cut

has 'fieldId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< fieldtype >>

The type of the field changed.

=cut

has 'fieldtype' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< from >>

The details of the original value.

=cut

has 'from' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< fromString >>

The details of the original value as a string.

=cut

has 'fromString' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< to >>

The details of the new value.

=cut

has 'to' => (
    is       => 'ro',
    isa      => Str,
);


1;
