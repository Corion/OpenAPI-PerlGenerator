package JIRA::API::FunctionOperand 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::FunctionOperand -

=head1 SYNOPSIS

  my $obj = JIRA::API::FunctionOperand->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< arguments >>

The list of function arguments.

=cut

has 'arguments' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
    required => 1,
);

=head2 C<< encodedOperand >>

Encoded operand, which can be used directly in a JQL query.

=cut

has 'encodedOperand' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< function >>

The name of the function.

=cut

has 'function' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
