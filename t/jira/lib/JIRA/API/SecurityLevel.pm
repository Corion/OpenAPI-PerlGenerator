package JIRA::API::SecurityLevel 0.01;
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

JIRA::API::SecurityLevel -

=head1 SYNOPSIS

  my $obj = JIRA::API::SecurityLevel->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< description >>

The description of the issue level security item.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< id >>

The ID of the issue level security item.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< isDefault >>

Whether the issue level security item is the default.

=cut

has 'isDefault' => (
    is       => 'ro',
);

=head2 C<< issueSecuritySchemeId >>

The ID of the issue level security scheme.

=cut

has 'issueSecuritySchemeId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the issue level security item.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< self >>

The URL of the issue level security item.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);


1;
