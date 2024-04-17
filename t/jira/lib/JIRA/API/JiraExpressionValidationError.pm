package JIRA::API::JiraExpressionValidationError 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::JiraExpressionValidationError -

=head1 SYNOPSIS

  my $obj = JIRA::API::JiraExpressionValidationError->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< column >>

The text column in which the error occurred.

=cut

has 'column' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< expression >>

The part of the expression in which the error occurred.

=cut

has 'expression' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< line >>

The text line in which the error occurred.

=cut

has 'line' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< message >>

Details about the error.

=cut

has 'message' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< type >>

The error type.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Enum[
        "syntax",
        "type",
        "other",
    ],
    required => 1,
);


1;
