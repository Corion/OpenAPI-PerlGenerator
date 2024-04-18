package JIRA::API::BulkPermissionGrants 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::BulkPermissionGrants -

=head1 SYNOPSIS

  my $obj = JIRA::API::BulkPermissionGrants->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< globalPermissions >>

List of permissions granted to the user.

=cut

has 'globalPermissions' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
    required => 1,
);

=head2 C<< projectPermissions >>

List of project permissions and the projects and issues those permissions provide access to.

=cut

has 'projectPermissions' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
    required => 1,
);


1;
