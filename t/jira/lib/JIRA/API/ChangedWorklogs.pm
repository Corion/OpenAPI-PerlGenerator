package JIRA::API::ChangedWorklogs 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::ChangedWorklogs -

=head1 SYNOPSIS

  my $obj = JIRA::API::ChangedWorklogs->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< lastPage >>

=cut

has 'lastPage' => (
    is       => 'ro',
);

=head2 C<< nextPage >>

The URL of the next list of changed worklogs.

=cut

has 'nextPage' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< self >>

The URL of this changed worklogs list.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< since >>

The datetime of the first worklog item in the list.

=cut

has 'since' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< until >>

The datetime of the last worklog item in the list.

=cut

has 'until' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< values >>

Changed worklog list.

=cut

has 'values' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);


1;