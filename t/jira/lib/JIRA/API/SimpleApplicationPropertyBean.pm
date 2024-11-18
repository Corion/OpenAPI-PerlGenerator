package JIRA::API::SimpleApplicationPropertyBean 0.01;
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

JIRA::API::SimpleApplicationPropertyBean -

=head1 SYNOPSIS

  my $obj = JIRA::API::SimpleApplicationPropertyBean->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< id >>

The ID of the application property.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< value >>

The new value.

=cut

has 'value' => (
    is       => 'ro',
    isa      => Str,
);


1;
