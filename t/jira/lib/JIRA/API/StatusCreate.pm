package JIRA::API::StatusCreate 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::StatusCreate -

=head1 SYNOPSIS

  my $obj = JIRA::API::StatusCreate->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< description >>

The description of the status.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the status.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< statusCategory >>

The category of the status.

=cut

has 'statusCategory' => (
    is       => 'ro',
    isa      => Enum[
        "TODO",
        "IN_PROGRESS",
        "DONE",
    ],
    required => 1,
);


1;
