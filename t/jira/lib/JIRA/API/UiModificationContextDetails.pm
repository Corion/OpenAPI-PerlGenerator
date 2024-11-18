package JIRA::API::UiModificationContextDetails 0.01;
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

JIRA::API::UiModificationContextDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::UiModificationContextDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< id >>

The ID of the UI modification context.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< isAvailable >>

Whether a context is available. For example, when a project is deleted the context becomes unavailable.

=cut

has 'isAvailable' => (
    is       => 'ro',
);

=head2 C<< issueTypeId >>

The issue type ID of the context.

=cut

has 'issueTypeId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< projectId >>

The project ID of the context.

=cut

has 'projectId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< viewType >>

The view type of the context. Only `GIC` (Global Issue Create) is supported.

=cut

has 'viewType' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
