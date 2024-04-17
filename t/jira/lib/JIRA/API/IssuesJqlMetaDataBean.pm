package JIRA::API::IssuesJqlMetaDataBean 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::IssuesJqlMetaDataBean -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssuesJqlMetaDataBean->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< count >>

The number of issues that were loaded in this evaluation.

=cut

has 'count' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< maxResults >>

The maximum number of issues that could be loaded in this evaluation.

=cut

has 'maxResults' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< startAt >>

The index of the first issue.

=cut

has 'startAt' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< totalCount >>

The total number of issues the JQL returned.

=cut

has 'totalCount' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< validationWarnings >>

Any warnings related to the JQL query. Present only if the validation mode was set to `warn`.

=cut

has 'validationWarnings' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);


1;
