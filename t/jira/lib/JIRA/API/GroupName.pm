package JIRA::API::GroupName 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::GroupName -

=head1 SYNOPSIS

  my $obj = JIRA::API::GroupName->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< groupId >>

The ID of the group, which uniquely identifies the group across all Atlassian products. For example, *952d12c3-5b5b-4d04-bb32-44d383afc4b2*.

=cut

has 'groupId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of group.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< self >>

The URL for these group details.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);


1;
