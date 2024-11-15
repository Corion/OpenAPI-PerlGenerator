package JIRA::API::IssueTypeScreenSchemeItem 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::IssueTypeScreenSchemeItem -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssueTypeScreenSchemeItem->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< issueTypeId >>

The ID of the issue type or *default*. Only issue types used in classic projects are accepted. When creating an issue screen scheme, an entry for *default* must be provided and defines the mapping for all issue types without a screen scheme. Otherwise, a *default* entry can't be provided.

=cut

has 'issueTypeId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< issueTypeScreenSchemeId >>

The ID of the issue type screen scheme.

=cut

has 'issueTypeScreenSchemeId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< screenSchemeId >>

The ID of the screen scheme.

=cut

has 'screenSchemeId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
