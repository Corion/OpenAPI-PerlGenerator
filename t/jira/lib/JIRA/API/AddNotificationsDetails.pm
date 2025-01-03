package JIRA::API::AddNotificationsDetails 0.01;
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

JIRA::API::AddNotificationsDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::AddNotificationsDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< notificationSchemeEvents >>

The list of notifications which should be added to the notification scheme.

=cut

has 'notificationSchemeEvents' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
    required => 1,
);


1;
