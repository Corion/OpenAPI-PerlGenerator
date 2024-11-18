package JIRA::API::PermissionsKeysBean 0.01;
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

JIRA::API::PermissionsKeysBean -

=head1 SYNOPSIS

  my $obj = JIRA::API::PermissionsKeysBean->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< permissions >>

A list of permission keys.

=cut

has 'permissions' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
    required => 1,
);


1;
