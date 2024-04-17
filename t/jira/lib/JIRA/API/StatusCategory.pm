package JIRA::API::StatusCategory 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::StatusCategory -

=head1 SYNOPSIS

  my $obj = JIRA::API::StatusCategory->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< colorName >>

The name of the color used to represent the status category.

=cut

has 'colorName' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< id >>

The ID of the status category.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< key >>

The key of the status category.

=cut

has 'key' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the status category.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< self >>

The URL of the status category.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);


1;
