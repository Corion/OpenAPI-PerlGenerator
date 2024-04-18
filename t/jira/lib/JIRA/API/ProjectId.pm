package JIRA::API::ProjectId 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::ProjectId -

=head1 SYNOPSIS

  my $obj = JIRA::API::ProjectId->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< id >>

The ID of the project.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
