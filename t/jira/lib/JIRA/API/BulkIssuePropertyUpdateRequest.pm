package JIRA::API::BulkIssuePropertyUpdateRequest 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::BulkIssuePropertyUpdateRequest -

=head1 SYNOPSIS

  my $obj = JIRA::API::BulkIssuePropertyUpdateRequest->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< expression >>

EXPERIMENTAL. The Jira expression to calculate the value of the property. The value of the expression must be an object that can be converted to JSON, such as a number, boolean, string, list, or map. The context variables available to the expression are `issue` and `user`. Issues for which the expression returns a value whose JSON representation is longer than 32768 characters are ignored.

=cut

has 'expression' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< filter >>

The bulk operation filter.

=cut

has 'filter' => (
    is       => 'ro',
);

=head2 C<< value >>

The value of the property. The value must be a [valid](https://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.

=cut

has 'value' => (
    is       => 'ro',
);


1;
