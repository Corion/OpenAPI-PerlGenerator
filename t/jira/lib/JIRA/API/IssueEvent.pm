package JIRA::API::IssueEvent 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::IssueEvent -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssueEvent->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< id >>

The ID of the event.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< name >>

The name of the event.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);


1;
