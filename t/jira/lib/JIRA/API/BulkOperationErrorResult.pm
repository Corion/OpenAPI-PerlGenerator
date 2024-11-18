package JIRA::API::BulkOperationErrorResult 0.01;
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

JIRA::API::BulkOperationErrorResult -

=head1 SYNOPSIS

  my $obj = JIRA::API::BulkOperationErrorResult->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< elementErrors >>

Error messages from an operation.

=cut

has 'elementErrors' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< failedElementNumber >>

=cut

has 'failedElementNumber' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< status >>

=cut

has 'status' => (
    is       => 'ro',
    isa      => Int,
);


1;
