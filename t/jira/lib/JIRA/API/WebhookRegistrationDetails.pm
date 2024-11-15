package JIRA::API::WebhookRegistrationDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::WebhookRegistrationDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::WebhookRegistrationDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< url >>

The URL that specifies where to send the webhooks. This URL must use the same base URL as the Connect app. Only a single URL per app is allowed to be registered.

=cut

has 'url' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< webhooks >>

A list of webhooks.

=cut

has 'webhooks' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
    required => 1,
);


1;
