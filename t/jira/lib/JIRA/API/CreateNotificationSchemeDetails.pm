package JIRA::API::CreateNotificationSchemeDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::CreateNotificationSchemeDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::CreateNotificationSchemeDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< description >>

The description of the notification scheme.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the notification scheme. Must be unique (case-insensitive).

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< notificationSchemeEvents >>

The list of notifications which should be added to the notification scheme.

=cut

has 'notificationSchemeEvents' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);


1;
