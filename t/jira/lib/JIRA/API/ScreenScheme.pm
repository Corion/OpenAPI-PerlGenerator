package JIRA::API::ScreenScheme 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::ScreenScheme -

=head1 SYNOPSIS

  my $obj = JIRA::API::ScreenScheme->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< description >>

The description of the screen scheme.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< id >>

The ID of the screen scheme.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< issueTypeScreenSchemes >>

Details of the issue type screen schemes associated with the screen scheme.

=cut

has 'issueTypeScreenSchemes' => (
    is       => 'ro',
);

=head2 C<< name >>

The name of the screen scheme.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< screens >>

The IDs of the screens for the screen types of the screen scheme.

=cut

has 'screens' => (
    is       => 'ro',
);


1;
