package JIRA::API::ConnectCustomFieldValue 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::ConnectCustomFieldValue -

=head1 SYNOPSIS

  my $obj = JIRA::API::ConnectCustomFieldValue->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< _type >>

The type of custom field.

=cut

has '_type' => (
    is       => 'ro',
    isa      => Enum[
        "StringIssueField",
        "NumberIssueField",
        "RichTextIssueField",
        "SingleSelectIssueField",
        "MultiSelectIssueField",
        "TextIssueField",
    ],
    required => 1,
);

=head2 C<< fieldID >>

The custom field ID.

=cut

has 'fieldID' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< issueID >>

The issue ID.

=cut

has 'issueID' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< number >>

The value of number type custom field when `_type` is `NumberIssueField`.

=cut

has 'number' => (
    is       => 'ro',
    isa      => Num,
);

=head2 C<< optionID >>

The value of single select and multiselect custom field type when `_type` is `SingleSelectIssueField` or `MultiSelectIssueField`.

=cut

has 'optionID' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< richText >>

The value of richText type custom field when `_type` is `RichTextIssueField`.

=cut

has 'richText' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< string >>

The value of string type custom field when `_type` is `StringIssueField`.

=cut

has 'string' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< text >>

The value of of text custom field type when `_type` is `TextIssueField`.

=cut

has 'text' => (
    is       => 'ro',
    isa      => Str,
);


1;
