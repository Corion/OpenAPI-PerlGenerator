package JIRA::API::ReorderIssueResolutionsRequest 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::ReorderIssueResolutionsRequest -

=head1 SYNOPSIS

  my $obj = JIRA::API::ReorderIssueResolutionsRequest->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< after >>

The ID of the resolution. Required if `position` isn't provided.

=cut

has 'after' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< ids >>

The list of resolution IDs to be reordered. Cannot contain duplicates nor after ID.

=cut

has 'ids' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
    required => 1,
);

=head2 C<< position >>

The position for issue resolutions to be moved to. Required if `after` isn't provided.

=cut

has 'position' => (
    is       => 'ro',
    isa      => Str,
);


1;