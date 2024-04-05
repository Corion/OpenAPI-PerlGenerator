package JIRA::API::StatusDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::StatusDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::StatusDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< description >>

The description of the status.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< iconUrl >>

The URL of the icon used to represent the status.

=cut

has 'iconUrl' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< id >>

The ID of the status.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the status.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< self >>

The URL of the status.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< statusCategory >>

The category assigned to the status.

=cut

has 'statusCategory' => (
    is       => 'ro',
);


1;
