package JIRA::API::ContextualConfiguration 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::ContextualConfiguration -

=head1 SYNOPSIS

  my $obj = JIRA::API::ContextualConfiguration->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< configuration >>

The field configuration.

=cut

has 'configuration' => (
    is       => 'ro',
);

=head2 C<< fieldContextId >>

The ID of the field context the configuration is associated with.

=cut

has 'fieldContextId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< id >>

The ID of the configuration.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< schema >>

The field value schema.

=cut

has 'schema' => (
    is       => 'ro',
);


1;
