package JIRA::API::FailedWebhooks 0.01;
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

JIRA::API::FailedWebhooks -

=head1 SYNOPSIS

  my $obj = JIRA::API::FailedWebhooks->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< maxResults >>

The maximum number of items on the page. If the list of values is shorter than this number, then there are no more pages.

=cut

has 'maxResults' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< next >>

The URL to the next page of results. Present only if the request returned at least one result.The next page may be empty at the time of receiving the response, but new failed webhooks may appear in time. You can save the URL to the next page and query for new results periodically (for example, every hour).

=cut

has 'next' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< values >>

The list of webhooks.

=cut

has 'values' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
    required => 1,
);


1;
