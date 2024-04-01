package JIRA::API::CustomFieldContextOption 0.01;
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

=head2 C<< disabled >>

Whether the option is disabled.

=cut

has 'disabled' => (
    is       => 'ro',
    required => 1,
);

=head2 C<< id >>

The ID of the custom field option.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< optionId >>

For cascading options, the ID of the custom field option containing the cascading option.

=cut

has 'optionId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< value >>

The value of the custom field option.

=cut

has 'value' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
