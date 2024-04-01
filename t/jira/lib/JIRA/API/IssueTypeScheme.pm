package JIRA::API::IssueTypeScheme 0.01;
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

=head2 C<< defaultIssueTypeId >>

The ID of the default issue type of the issue type scheme.

=cut

has 'defaultIssueTypeId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< description >>

The description of the issue type scheme.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< id >>

The ID of the issue type scheme.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< isDefault >>

Whether the issue type scheme is the default.

=cut

has 'isDefault' => (
    is       => 'ro',
);

=head2 C<< name >>

The name of the issue type scheme.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
