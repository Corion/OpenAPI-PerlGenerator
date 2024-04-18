package JIRA::API::DashboardDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::DashboardDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::DashboardDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< description >>

The description of the dashboard.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< editPermissions >>

The edit permissions for the dashboard.

=cut

has 'editPermissions' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
    required => 1,
);

=head2 C<< name >>

The name of the dashboard.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< sharePermissions >>

The share permissions for the dashboard.

=cut

has 'sharePermissions' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
    required => 1,
);


1;
