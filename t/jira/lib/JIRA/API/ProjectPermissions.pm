package JIRA::API::ProjectPermissions 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::ProjectPermissions -

=head1 SYNOPSIS

  my $obj = JIRA::API::ProjectPermissions->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< canEdit >>

Whether the logged user can edit the project.

=cut

has 'canEdit' => (
    is       => 'ro',
);


1;
