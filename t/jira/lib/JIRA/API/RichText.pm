package JIRA::API::RichText 0.01;
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

JIRA::API::RichText -

=head1 SYNOPSIS

  my $obj = JIRA::API::RichText->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< empty >>

=cut

has 'empty' => (
    is       => 'ro',
);

=head2 C<< emptyAdf >>

=cut

has 'emptyAdf' => (
    is       => 'ro',
);

=head2 C<< finalised >>

=cut

has 'finalised' => (
    is       => 'ro',
);

=head2 C<< valueSet >>

=cut

has 'valueSet' => (
    is       => 'ro',
);


1;
