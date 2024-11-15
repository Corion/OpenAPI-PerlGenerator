package OpenAPI::PetStore::Pet 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

OpenAPI::PetStore::Pet -

=head1 SYNOPSIS

  my $obj = OpenAPI::PetStore::Pet->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

extends 'OpenAPI::PetStore::NewPet';

=head1 PROPERTIES

=head2 C<< id >>

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
);


1;
