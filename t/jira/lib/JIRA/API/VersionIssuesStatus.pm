package JIRA::API::VersionIssuesStatus 0.01;
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

JIRA::API::VersionIssuesStatus -

=head1 SYNOPSIS

  my $obj = JIRA::API::VersionIssuesStatus->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< done >>

Count of issues with status *done*.

=cut

has 'done' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< inProgress >>

Count of issues with status *in progress*.

=cut

has 'inProgress' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< toDo >>

Count of issues with status *to do*.

=cut

has 'toDo' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< unmapped >>

Count of issues with a status other than *to do*, *in progress*, and *done*.

=cut

has 'unmapped' => (
    is       => 'ro',
    isa      => Int,
);


1;
