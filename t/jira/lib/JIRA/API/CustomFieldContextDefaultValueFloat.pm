package JIRA::API::CustomFieldContextDefaultValueFloat 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::CustomFieldContextDefaultValueFloat -

=head1 SYNOPSIS

  my $obj = JIRA::API::CustomFieldContextDefaultValueFloat->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< number >>

The default floating-point number.

=cut

has 'number' => (
    is       => 'ro',
    isa      => Num,
    required => 1,
);

=head2 C<< type >>

=cut

has 'type' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
