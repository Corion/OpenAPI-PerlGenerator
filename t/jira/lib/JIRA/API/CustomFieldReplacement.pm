package JIRA::API::CustomFieldReplacement 0.01;
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

=head2 C<< customFieldId >>

The ID of the custom field in which to replace the version number.

=cut

has 'customFieldId' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< moveTo >>

The version number to use as a replacement for the deleted version.

=cut

has 'moveTo' => (
    is       => 'ro',
    isa      => Int,
);


1;
