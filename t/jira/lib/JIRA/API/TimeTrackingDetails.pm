package JIRA::API::TimeTrackingDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::TimeTrackingDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::TimeTrackingDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< originalEstimate >>

The original estimate of time needed for this issue in readable format.

=cut

has 'originalEstimate' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< originalEstimateSeconds >>

The original estimate of time needed for this issue in seconds.

=cut

has 'originalEstimateSeconds' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< remainingEstimate >>

The remaining estimate of time needed for this issue in readable format.

=cut

has 'remainingEstimate' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< remainingEstimateSeconds >>

The remaining estimate of time needed for this issue in seconds.

=cut

has 'remainingEstimateSeconds' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< timeSpent >>

Time worked on this issue in readable format.

=cut

has 'timeSpent' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< timeSpentSeconds >>

Time worked on this issue in seconds.

=cut

has 'timeSpentSeconds' => (
    is       => 'ro',
    isa      => Int,
);


1;
