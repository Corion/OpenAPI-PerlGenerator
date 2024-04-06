package JIRA::API::IssueMatches 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::IssueMatches -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssueMatches->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< matches >>

=cut

has 'matches' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
    required => 1,
);


1;