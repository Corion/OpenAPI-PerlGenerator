package JIRA::API::ContainerForWebhookIDs 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::ContainerForWebhookIDs -

=head1 SYNOPSIS

  my $obj = JIRA::API::ContainerForWebhookIDs->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< webhookIds >>

A list of webhook IDs.

=cut

has 'webhookIds' => (
    is       => 'ro',
    isa      => ArrayRef[Int],
    required => 1,
);


1;
