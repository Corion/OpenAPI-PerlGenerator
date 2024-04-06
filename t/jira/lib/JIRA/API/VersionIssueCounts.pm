package JIRA::API::VersionIssueCounts 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::VersionIssueCounts -

=head1 SYNOPSIS

  my $obj = JIRA::API::VersionIssueCounts->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< customFieldUsage >>

List of custom fields using the version.

=cut

has 'customFieldUsage' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< issueCountWithCustomFieldsShowingVersion >>

Count of issues where a version custom field is set to the version.

=cut

has 'issueCountWithCustomFieldsShowingVersion' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< issuesAffectedCount >>

Count of issues where the `affectedVersion` is set to the version.

=cut

has 'issuesAffectedCount' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< issuesFixedCount >>

Count of issues where the `fixVersion` is set to the version.

=cut

has 'issuesFixedCount' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< self >>

The URL of these count details.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);


1;