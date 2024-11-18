package JIRA::API::AvatarUrlsBean 0.01;
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

JIRA::API::AvatarUrlsBean -

=head1 SYNOPSIS

  my $obj = JIRA::API::AvatarUrlsBean->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< _16x16 >>

The URL of the item's 16x16 pixel avatar.

=cut

has '_16x16' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< _24x24 >>

The URL of the item's 24x24 pixel avatar.

=cut

has '_24x24' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< _32x32 >>

The URL of the item's 32x32 pixel avatar.

=cut

has '_32x32' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< _48x48 >>

The URL of the item's 48x48 pixel avatar.

=cut

has '_48x48' => (
    is       => 'ro',
    isa      => Str,
);


1;
