package JIRA::API::RemoteIssueLinkIdentifies 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::RemoteIssueLinkIdentifies -

=head1 SYNOPSIS

  my $obj = JIRA::API::RemoteIssueLinkIdentifies->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< id >>

The ID of the remote issue link, such as the ID of the item on the remote system.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< self >>

The URL of the remote issue link.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);


1;
