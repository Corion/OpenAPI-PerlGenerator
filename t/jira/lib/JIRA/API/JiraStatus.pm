package JIRA::API::JiraStatus 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

use namespace::clean;

=encoding utf8

=head1 NAME

JIRA::API::JiraStatus -

=head1 SYNOPSIS

  my $obj = JIRA::API::JiraStatus->new();
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

=head2 C<< id >>

The ID of the status.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the status.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< scope >>

The scope of the status.

=cut

has 'scope' => (
    is       => 'ro',
    isa      => HashRef,
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
);

=head2 C<< usages >>

Projects and issue types where the status is used. Only available if the `usages` expand is requested.

=cut

has 'usages' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);


1;
