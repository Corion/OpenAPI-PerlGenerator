package JIRA::API::WorkflowTransitionProperty 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::WorkflowTransitionProperty -

=head1 SYNOPSIS

  my $obj = JIRA::API::WorkflowTransitionProperty->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< id >>

The ID of the transition property.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< key >>

The key of the transition property. Also known as the name of the transition property.

=cut

has 'key' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< value >>

The value of the transition property.

=cut

has 'value' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
