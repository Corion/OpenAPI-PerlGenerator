package OpenAPI::PetStore::Error 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

OpenAPI::PetStore::Error -

=head1 SYNOPSIS

  my $obj = OpenAPI::PetStore::Error->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< code >>

=cut

has 'code' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< message >>

=cut

has 'message' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
