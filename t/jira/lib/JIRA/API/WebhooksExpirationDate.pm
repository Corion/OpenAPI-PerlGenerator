package JIRA::API::WebhooksExpirationDate 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::WebhooksExpirationDate -

=head1 SYNOPSIS

  my $obj = JIRA::API::WebhooksExpirationDate->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< expirationDate >>

The expiration date of all the refreshed webhooks.

=cut

has 'expirationDate' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);


1;
