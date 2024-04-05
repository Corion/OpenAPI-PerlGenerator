package JIRA::API::ScreenSchemeId 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::ScreenSchemeId -

=head1 SYNOPSIS

  my $obj = JIRA::API::ScreenSchemeId->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< id >>

The ID of the screen scheme.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);


1;
