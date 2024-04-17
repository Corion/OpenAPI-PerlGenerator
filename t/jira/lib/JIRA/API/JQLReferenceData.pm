package JIRA::API::JQLReferenceData 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::JQLReferenceData -

=head1 SYNOPSIS

  my $obj = JIRA::API::JQLReferenceData->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< jqlReservedWords >>

List of JQL query reserved words.

=cut

has 'jqlReservedWords' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);

=head2 C<< visibleFieldNames >>

List of fields usable in JQL queries.

=cut

has 'visibleFieldNames' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< visibleFunctionNames >>

List of functions usable in JQL queries.

=cut

has 'visibleFunctionNames' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);


1;
