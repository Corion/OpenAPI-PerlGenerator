package JIRA::API::WorkflowSimpleCondition 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::WorkflowSimpleCondition -

=head1 SYNOPSIS

  my $obj = JIRA::API::WorkflowSimpleCondition->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< configuration >>

EXPERIMENTAL. The configuration of the transition rule.

=cut

has 'configuration' => (
    is       => 'ro',
    isa      => Object,
);

=head2 C<< nodeType >>

=cut

has 'nodeType' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< type >>

The type of the transition rule.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
