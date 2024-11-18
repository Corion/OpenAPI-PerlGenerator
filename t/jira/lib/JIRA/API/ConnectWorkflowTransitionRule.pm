package JIRA::API::ConnectWorkflowTransitionRule 0.01;
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

JIRA::API::ConnectWorkflowTransitionRule -

=head1 SYNOPSIS

  my $obj = JIRA::API::ConnectWorkflowTransitionRule->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< configuration >>

A rule configuration.

=cut

has 'configuration' => (
    is       => 'ro',
    isa      => HashRef,
    required => 1,
);

=head2 C<< id >>

The ID of the transition rule.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< key >>

The key of the rule, as defined in the Connect app descriptor.

=cut

has 'key' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< transition >>

=cut

has 'transition' => (
    is       => 'ro',
);


1;
