package JIRA::API::OperationMessage 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::OperationMessage -

=head1 SYNOPSIS

  my $obj = JIRA::API::OperationMessage->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< message >>

The human-readable message that describes the result.

=cut

has 'message' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< statusCode >>

The status code of the response.

=cut

has 'statusCode' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);


1;
