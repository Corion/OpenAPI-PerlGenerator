package JIRA::API::SetDefaultResolutionRequest 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::SetDefaultResolutionRequest -

=head1 SYNOPSIS

  my $obj = JIRA::API::SetDefaultResolutionRequest->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< id >>

The ID of the new default issue resolution. Must be an existing ID or null. Setting this to null erases the default resolution setting.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
