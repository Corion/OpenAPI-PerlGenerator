package JIRA::API::ScreenSchemeDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::ScreenSchemeDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::ScreenSchemeDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< description >>

The description of the screen scheme. The maximum length is 255 characters.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the screen scheme. The name must be unique. The maximum length is 255 characters.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< screens >>

The IDs of the screens for the screen types of the screen scheme. Only screens used in classic projects are accepted.

=cut

has 'screens' => (
    is       => 'ro',
    required => 1,
);


1;
