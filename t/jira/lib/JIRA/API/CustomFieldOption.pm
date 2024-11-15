package JIRA::API::CustomFieldOption 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::CustomFieldOption -

=head1 SYNOPSIS

  my $obj = JIRA::API::CustomFieldOption->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< self >>

The URL of these custom field option details.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< value >>

The value of the custom field option.

=cut

has 'value' => (
    is       => 'ro',
    isa      => Str,
);


1;
