package JIRA::API::TransitionScreenDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::TransitionScreenDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::TransitionScreenDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< id >>

The ID of the screen.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< name >>

The name of the screen.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);


1;
