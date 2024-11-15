package JIRA::API::CreatePriorityDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::CreatePriorityDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::CreatePriorityDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< description >>

The description of the priority.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< iconUrl >>

The URL of an icon for the priority. Accepted protocols are HTTP and HTTPS. Built in icons can also be used.

=cut

has 'iconUrl' => (
    is       => 'ro',
    isa      => Enum[
        "/images/icons/priorities/blocker.png",
        "/images/icons/priorities/critical.png",
        "/images/icons/priorities/high.png",
        "/images/icons/priorities/highest.png",
        "/images/icons/priorities/low.png",
        "/images/icons/priorities/lowest.png",
        "/images/icons/priorities/major.png",
        "/images/icons/priorities/medium.png",
        "/images/icons/priorities/minor.png",
        "/images/icons/priorities/trivial.png",
    ],
);

=head2 C<< name >>

The name of the priority. Must be unique.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< statusColor >>

The status color of the priority in 3-digit or 6-digit hexadecimal format.

=cut

has 'statusColor' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
