package JIRA::API::ProjectIdentifiers 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::ProjectIdentifiers -

=head1 SYNOPSIS

  my $obj = JIRA::API::ProjectIdentifiers->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< id >>

The ID of the created project.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< key >>

The key of the created project.

=cut

has 'key' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< self >>

The URL of the created project.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
