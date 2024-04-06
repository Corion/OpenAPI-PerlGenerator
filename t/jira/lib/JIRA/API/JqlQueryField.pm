package JIRA::API::JqlQueryField 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::JqlQueryField -

=head1 SYNOPSIS

  my $obj = JIRA::API::JqlQueryField->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< encodedName >>

The encoded name of the field, which can be used directly in a JQL query.

=cut

has 'encodedName' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the field.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< property >>

When the field refers to a value in an entity property, details of the entity property value.

=cut

has 'property' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);


1;