package JIRA::API::NotificationScheme 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::NotificationScheme -

=head1 SYNOPSIS

  my $obj = JIRA::API::NotificationScheme->new();
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

=head2 C<< expand >>

Expand options that include additional notification scheme details in the response.

=cut

has 'expand' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< id >>

The ID of the notification scheme.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< name >>

The name of the notification scheme.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< notificationSchemeEvents >>

The notification events and associated recipients.

=cut

has 'notificationSchemeEvents' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< projects >>

The list of project IDs associated with the notification scheme.

=cut

has 'projects' => (
    is       => 'ro',
    isa      => ArrayRef[Int],
);

=head2 C<< scope >>

The scope of the notification scheme.

=cut

has 'scope' => (
    is       => 'ro',
);

=head2 C<< self >>

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);


1;
