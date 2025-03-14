package JIRA::API::BulkCustomFieldOptionUpdateRequest 0.01;
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

JIRA::API::BulkCustomFieldOptionUpdateRequest -

=head1 SYNOPSIS

  my $obj = JIRA::API::BulkCustomFieldOptionUpdateRequest->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< options >>

Details of the options to update.

=cut

has 'options' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);


1;
