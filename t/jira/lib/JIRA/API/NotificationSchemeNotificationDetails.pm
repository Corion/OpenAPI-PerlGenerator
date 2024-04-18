package JIRA::API::NotificationSchemeNotificationDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::NotificationSchemeNotificationDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::NotificationSchemeNotificationDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< notificationType >>

The notification type, e.g `CurrentAssignee`, `Group`, `EmailAddress`.

=cut

has 'notificationType' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< parameter >>

The value corresponding to the specified notification type.

=cut

has 'parameter' => (
    is       => 'ro',
    isa      => Str,
);


1;
