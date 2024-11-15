package JIRA::API::FieldLastUsed 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::FieldLastUsed -

=head1 SYNOPSIS

  my $obj = JIRA::API::FieldLastUsed->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< type >>

Last used value type:

 *  *TRACKED*: field is tracked and a last used date is available.
 *  *NOT\_TRACKED*: field is not tracked, last used date is not available.
 *  *NO\_INFORMATION*: field is tracked, but no last used date is available.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Enum[
        "TRACKED",
        "NOT_TRACKED",
        "NO_INFORMATION",
    ],
);

=head2 C<< value >>

The date when the value of the field last changed.

=cut

has 'value' => (
    is       => 'ro',
    isa      => Str,
);


1;
