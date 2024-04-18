package JIRA::API::PermissionGrants 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::PermissionGrants -

=head1 SYNOPSIS

  my $obj = JIRA::API::PermissionGrants->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< expand >>

Expand options that include additional permission grant details in the response.

=cut

has 'expand' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< permissions >>

Permission grants list.

=cut

has 'permissions' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);


1;
