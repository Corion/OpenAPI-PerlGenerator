package JIRA::API::IssueCommentListRequestBean 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::IssueCommentListRequestBean -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssueCommentListRequestBean->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< ids >>

The list of comment IDs. A maximum of 1000 IDs can be specified.

=cut

has 'ids' => (
    is       => 'ro',
    isa      => ArrayRef[Int],
    required => 1,
);


1;