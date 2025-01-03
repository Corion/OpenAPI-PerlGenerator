package JIRA::API::IssuePickerSuggestionsIssueType 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

use namespace::clean;

=encoding utf8

=head1 NAME

JIRA::API::IssuePickerSuggestionsIssueType -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssuePickerSuggestionsIssueType->new();
  ...

=cut

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
    isa      => ArrayRef[HashRef],
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
