package JIRA::API::JexpJqlIssues 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< maxResults >>

The maximum number of issues to return from the JQL query. Inspect `meta.issues.jql.maxResults` in the response to ensure the maximum value has not been exceeded.

=cut

has 'maxResults' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< query >>

The JQL query.

=cut

has 'query' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< startAt >>

The index of the first issue to return from the JQL query.

=cut

has 'startAt' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< validation >>

Determines how to validate the JQL query and treat the validation results.

=cut

has 'validation' => (
    is       => 'ro',
    isa      => Str,
);


1;
