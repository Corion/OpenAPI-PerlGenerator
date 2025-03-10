package JIRA::API::CreateWorkflowCondition 0.01;
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

JIRA::API::CreateWorkflowCondition -

=head1 SYNOPSIS

  my $obj = JIRA::API::CreateWorkflowCondition->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< conditions >>

The list of workflow conditions.

=cut

has 'conditions' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< configuration >>

EXPERIMENTAL. The configuration of the transition rule.

=cut

has 'configuration' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< operator >>

The compound condition operator.

=cut

has 'operator' => (
    is       => 'ro',
    isa      => Enum[
        "AND",
        "OR",
    ],
);

=head2 C<< type >>

The type of the transition rule.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Str,
);


1;
