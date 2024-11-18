package JIRA::API::CustomFieldContextDefaultValueTextArea 0.01;
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

JIRA::API::CustomFieldContextDefaultValueTextArea -

=head1 SYNOPSIS

  my $obj = JIRA::API::CustomFieldContextDefaultValueTextArea->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< text >>

The default text. The maximum length is 32767 characters.

=cut

has 'text' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< type >>

=cut

has 'type' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
