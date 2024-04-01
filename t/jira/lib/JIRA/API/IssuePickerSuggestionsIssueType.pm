package JIRA::API::IssuePickerSuggestionsIssueType 0.01;
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

=head2 C<< id >>

The ID of the type of issues suggested for use in auto-completion.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< issues >>

A list of issues suggested for use in auto-completion.

=cut

has 'issues' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< label >>

The label of the type of issues suggested for use in auto-completion.

=cut

has 'label' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< msg >>

If no issue suggestions are found, returns a message indicating no suggestions were found,

=cut

has 'msg' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< sub >>

If issue suggestions are found, returns a message indicating the number of issues suggestions found and returned.

=cut

has 'sub' => (
    is       => 'ro',
    isa      => Str,
);


1;
