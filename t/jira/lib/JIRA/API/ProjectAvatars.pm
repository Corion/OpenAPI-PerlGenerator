package JIRA::API::ProjectAvatars 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::ProjectAvatars -

=head1 SYNOPSIS

  my $obj = JIRA::API::ProjectAvatars->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< custom >>

List of avatars added to Jira. These avatars may be deleted.

=cut

has 'custom' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< system >>

List of avatars included with Jira. These avatars cannot be deleted.

=cut

has 'system' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);


1;
