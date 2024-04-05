package JIRA::API::ChangeFilterOwner 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::ChangeFilterOwner -

=head1 SYNOPSIS

  my $obj = JIRA::API::ChangeFilterOwner->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< accountId >>

The account ID of the new owner.

=cut

has 'accountId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
