package JIRA::API::FieldConfigurationItem 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::FieldConfigurationItem -

=head1 SYNOPSIS

  my $obj = JIRA::API::FieldConfigurationItem->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< description >>

The description of the field within the field configuration.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< id >>

The ID of the field within the field configuration.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< isHidden >>

Whether the field is hidden in the field configuration.

=cut

has 'isHidden' => (
    is       => 'ro',
);

=head2 C<< isRequired >>

Whether the field is required in the field configuration.

=cut

has 'isRequired' => (
    is       => 'ro',
);

=head2 C<< renderer >>

The renderer type for the field within the field configuration.

=cut

has 'renderer' => (
    is       => 'ro',
    isa      => Str,
);


1;
