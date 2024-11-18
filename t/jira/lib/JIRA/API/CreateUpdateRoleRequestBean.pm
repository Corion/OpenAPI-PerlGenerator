package JIRA::API::CreateUpdateRoleRequestBean 0.01;
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

JIRA::API::CreateUpdateRoleRequestBean -

=head1 SYNOPSIS

  my $obj = JIRA::API::CreateUpdateRoleRequestBean->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< description >>

A description of the project role. Required when fully updating a project role. Optional when creating or partially updating a project role.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the project role. Must be unique. Cannot begin or end with whitespace. The maximum length is 255 characters. Required when creating a project role. Optional when partially updating a project role.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);


1;
