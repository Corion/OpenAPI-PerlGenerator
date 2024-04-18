package JIRA::API::CreateResolutionDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::CreateResolutionDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::CreateResolutionDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< description >>

The description of the resolution.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the resolution. Must be unique (case-insensitive).

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
