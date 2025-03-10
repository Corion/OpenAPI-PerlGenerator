package JIRA::API::SearchResults 0.01;
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

JIRA::API::SearchResults -

=head1 SYNOPSIS

  my $obj = JIRA::API::SearchResults->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< expand >>

Expand options that include additional search result details in the response.

=cut

has 'expand' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< issues >>

The list of issues found by the search.

=cut

has 'issues' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< maxResults >>

The maximum number of results that could be on the page.

=cut

has 'maxResults' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< names >>

The ID and name of each field in the search results.

=cut

has 'names' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< schema >>

The schema describing the field types in the search results.

=cut

has 'schema' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< startAt >>

The index of the first item returned on the page.

=cut

has 'startAt' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< total >>

The number of results on the page.

=cut

has 'total' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< warningMessages >>

Any warnings related to the JQL query.

=cut

has 'warningMessages' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);


1;
