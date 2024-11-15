package JIRA::API::WorkflowRules 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::WorkflowRules -

=head1 SYNOPSIS

  my $obj = JIRA::API::WorkflowRules->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< conditionsTree >>

The workflow transition rule conditions tree.

=cut

has 'conditionsTree' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< postFunctions >>

The workflow post functions.

=cut

has 'postFunctions' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< validators >>

The workflow validators.

=cut

has 'validators' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);


1;
