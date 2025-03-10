package JIRA::API::CustomFieldContextDefaultValueForgeObjectField 0.01;
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

JIRA::API::CustomFieldContextDefaultValueForgeObjectField -

=head1 SYNOPSIS

  my $obj = JIRA::API::CustomFieldContextDefaultValueForgeObjectField->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< object >>

The default JSON object.

=cut

has 'object' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< type >>

=cut

has 'type' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
