package JIRA::API::Watchers 0.01;
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

JIRA::API::Watchers -

=head1 SYNOPSIS

  my $obj = JIRA::API::Watchers->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< isWatching >>

Whether the calling user is watching this issue.

=cut

has 'isWatching' => (
    is       => 'ro',
);

=head2 C<< self >>

The URL of these issue watcher details.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< watchCount >>

The number of users watching this issue.

=cut

has 'watchCount' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< watchers >>

Details of the users watching this issue.

=cut

has 'watchers' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);


1;
