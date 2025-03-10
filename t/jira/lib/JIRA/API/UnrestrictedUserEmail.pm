package JIRA::API::UnrestrictedUserEmail 0.01;
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

JIRA::API::UnrestrictedUserEmail -

=head1 SYNOPSIS

  my $obj = JIRA::API::UnrestrictedUserEmail->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< accountId >>

The accountId of the user

=cut

has 'accountId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< email >>

The email of the user

=cut

has 'email' => (
    is       => 'ro',
    isa      => Str,
);


1;
