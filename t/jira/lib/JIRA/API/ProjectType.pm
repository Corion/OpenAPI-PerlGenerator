package JIRA::API::ProjectType 0.01;
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

JIRA::API::ProjectType -

=head1 SYNOPSIS

  my $obj = JIRA::API::ProjectType->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< color >>

The color of the project type.

=cut

has 'color' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< descriptionI18nKey >>

The key of the project type's description.

=cut

has 'descriptionI18nKey' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< formattedKey >>

The formatted key of the project type.

=cut

has 'formattedKey' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< icon >>

The icon of the project type.

=cut

has 'icon' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< key >>

The key of the project type.

=cut

has 'key' => (
    is       => 'ro',
    isa      => Str,
);


1;
