package JIRA::API::JexpIssues 0.01;
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

=head2 C<< jql >>

The JQL query that specifies the set of issues available in the Jira expression.

=cut

has 'jql' => (
    is       => 'ro',
);


1;
