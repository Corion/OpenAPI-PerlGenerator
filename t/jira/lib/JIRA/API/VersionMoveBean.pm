package JIRA::API::VersionMoveBean 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::VersionMoveBean -

=head1 SYNOPSIS

  my $obj = JIRA::API::VersionMoveBean->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< after >>

The URL (self link) of the version after which to place the moved version. Cannot be used with `position`.

=cut

has 'after' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< position >>

An absolute position in which to place the moved version. Cannot be used with `after`.

=cut

has 'position' => (
    is       => 'ro',
    isa      => Enum[
        "Earlier",
        "Later",
        "First",
        "Last",
    ],
);


1;
