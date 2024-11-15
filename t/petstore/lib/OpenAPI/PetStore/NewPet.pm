package OpenAPI::PetStore::NewPet 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

OpenAPI::PetStore::NewPet -

=head1 SYNOPSIS

  my $obj = OpenAPI::PetStore::NewPet->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< name >>

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< tag >>

=cut

has 'tag' => (
    is       => 'ro',
    isa      => Str,
);


1;
