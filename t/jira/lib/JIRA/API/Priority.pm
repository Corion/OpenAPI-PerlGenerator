package JIRA::API::Priority 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::Priority -

=head1 SYNOPSIS

  my $obj = JIRA::API::Priority->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< description >>

The description of the issue priority.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< iconUrl >>

The URL of the icon for the issue priority.

=cut

has 'iconUrl' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< id >>

The ID of the issue priority.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< isDefault >>

Whether this priority is the default.

=cut

has 'isDefault' => (
    is       => 'ro',
);

=head2 C<< name >>

The name of the issue priority.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< self >>

The URL of the issue priority.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< statusColor >>

The color used to indicate the issue priority.

=cut

has 'statusColor' => (
    is       => 'ro',
    isa      => Str,
);


1;
