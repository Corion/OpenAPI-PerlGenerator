package JIRA::API::ServerInformation 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::ServerInformation -

=head1 SYNOPSIS

  my $obj = JIRA::API::ServerInformation->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< baseUrl >>

The base URL of the Jira instance.

=cut

has 'baseUrl' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< buildDate >>

The timestamp when the Jira version was built.

=cut

has 'buildDate' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< buildNumber >>

The build number of the Jira version.

=cut

has 'buildNumber' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< deploymentType >>

The type of server deployment. This is always returned as *Cloud*.

=cut

has 'deploymentType' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< healthChecks >>

Jira instance health check results. Deprecated and no longer returned.

=cut

has 'healthChecks' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< scmInfo >>

The unique identifier of the Jira version.

=cut

has 'scmInfo' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< serverTime >>

The time in Jira when this request was responded to.

=cut

has 'serverTime' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< serverTitle >>

The name of the Jira instance.

=cut

has 'serverTitle' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< version >>

The version of Jira.

=cut

has 'version' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< versionNumbers >>

The major, minor, and revision version numbers of the Jira version.

=cut

has 'versionNumbers' => (
    is       => 'ro',
    isa      => ArrayRef[Int],
);


1;
