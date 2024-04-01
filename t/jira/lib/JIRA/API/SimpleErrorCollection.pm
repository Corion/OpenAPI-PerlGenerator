package JIRA::API::SimpleErrorCollection 0.01;
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

=head2 C<< errorMessages >>

The list of error messages produced by this operation. For example, "input parameter 'key' must be provided"

=cut

has 'errorMessages' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);

=head2 C<< errors >>

The list of errors by parameter returned by the operation. For example,"projectKey": "Project keys must start with an uppercase letter, followed by one or more uppercase alphanumeric characters."

=cut

has 'errors' => (
    is       => 'ro',
    isa      => Object,
);

=head2 C<< httpStatusCode >>

=cut

has 'httpStatusCode' => (
    is       => 'ro',
    isa      => Int,
);


1;
