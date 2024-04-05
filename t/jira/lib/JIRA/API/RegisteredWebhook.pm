package JIRA::API::RegisteredWebhook 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::RegisteredWebhook -

=head1 SYNOPSIS

  my $obj = JIRA::API::RegisteredWebhook->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< createdWebhookId >>

The ID of the webhook. Returned if the webhook is created.

=cut

has 'createdWebhookId' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< errors >>

Error messages specifying why the webhook creation failed.

=cut

has 'errors' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);


1;
