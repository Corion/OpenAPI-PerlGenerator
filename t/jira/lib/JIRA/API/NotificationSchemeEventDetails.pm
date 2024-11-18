package JIRA::API::NotificationSchemeEventDetails 0.01;
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

JIRA::API::NotificationSchemeEventDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::NotificationSchemeEventDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< event >>

The ID of the event.

=cut

has 'event' => (
    is       => 'ro',
    required => 1,
);

=head2 C<< notifications >>

The list of notifications mapped to a specified event.

=cut

has 'notifications' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
    required => 1,
);


1;
