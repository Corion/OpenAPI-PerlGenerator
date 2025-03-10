package JIRA::API::BulkPermissionsRequestBean 0.01;
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

JIRA::API::BulkPermissionsRequestBean -

=head1 SYNOPSIS

  my $obj = JIRA::API::BulkPermissionsRequestBean->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< accountId >>

The account ID of a user.

=cut

has 'accountId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< globalPermissions >>

Global permissions to look up.

=cut

has 'globalPermissions' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);

=head2 C<< projectPermissions >>

Project permissions with associated projects and issues to look up.

=cut

has 'projectPermissions' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);


1;
