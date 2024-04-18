package JIRA::API::PageOfComments 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::PageOfComments -

=head1 SYNOPSIS

  my $obj = JIRA::API::PageOfComments->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< comments >>

The list of comments.

=cut

has 'comments' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< maxResults >>

The maximum number of items that could be returned.

=cut

has 'maxResults' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< startAt >>

The index of the first item returned.

=cut

has 'startAt' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< total >>

The number of items returned.

=cut

has 'total' => (
    is       => 'ro',
    isa      => Int,
);


1;
