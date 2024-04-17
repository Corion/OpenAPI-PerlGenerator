package JIRA::API::JiraExpressionsComplexityValueBean 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::JiraExpressionsComplexityValueBean -

=head1 SYNOPSIS

  my $obj = JIRA::API::JiraExpressionsComplexityValueBean->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< limit >>

The maximum allowed complexity. The evaluation will fail if this value is exceeded.

=cut

has 'limit' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< value >>

The complexity value of the current expression.

=cut

has 'value' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);


1;
