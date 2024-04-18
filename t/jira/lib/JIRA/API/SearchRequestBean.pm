package JIRA::API::SearchRequestBean 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::SearchRequestBean -

=head1 SYNOPSIS

  my $obj = JIRA::API::SearchRequestBean->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< expand >>

Use [expand](em>#expansion) to include additional information about issues in the response. Note that, unlike the majority of instances where `expand` is specified, `expand` is defined as a list of values. The expand options are:

 *  `renderedFields` Returns field values rendered in HTML format.
 *  `names` Returns the display name of each field.
 *  `schema` Returns the schema describing a field type.
 *  `transitions` Returns all possible transitions for the issue.
 *  `operations` Returns all possible operations for the issue.
 *  `editmeta` Returns information about how each field can be edited.
 *  `changelog` Returns a list of recent updates to an issue, sorted by date, starting from the most recent.
 *  `versionedRepresentations` Instead of `fields`, returns `versionedRepresentations` a JSON array containing each version of a field's value, with the highest numbered item representing the most recent version.

=cut

has 'expand' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);

=head2 C<< fields >>

A list of fields to return for each issue, use it to retrieve a subset of fields. This parameter accepts a comma-separated list. Expand options include:

 *  `*all` Returns all fields.
 *  `*navigable` Returns navigable fields.
 *  Any issue field, prefixed with a minus to exclude.

The default is `*navigable`.

Examples:

 *  `summary,comment` Returns the summary and comments fields only.
 *  `-description` Returns all navigable (default) fields except description.
 *  `*all,-comment` Returns all fields except comments.

Multiple `fields` parameters can be included in a request.

Note: All navigable fields are returned by default. This differs from [GET issue](#api-rest-api-3-issue-issueIdOrKey-get) where the default is all fields.

=cut

has 'fields' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);

=head2 C<< fieldsByKeys >>

Reference fields by their key (rather than ID). The default is `false`.

=cut

has 'fieldsByKeys' => (
    is       => 'ro',
);

=head2 C<< jql >>

A [JQL](https://confluence.atlassian.com/x/egORLQ) expression.

=cut

has 'jql' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< maxResults >>

The maximum number of items to return per page.

=cut

has 'maxResults' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< properties >>

A list of up to 5 issue properties to include in the results. This parameter accepts a comma-separated list.

=cut

has 'properties' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);

=head2 C<< startAt >>

The index of the first item to return in the page of results (page offset). The base index is `0`.

=cut

has 'startAt' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< validateQuery >>

Determines how to validate the JQL query and treat the validation results. Supported values:

 *  `strict` Returns a 400 response code if any errors are found, along with a list of all errors (and warnings).
 *  `warn` Returns all errors as warnings.
 *  `none` No validation is performed.
 *  `true` *Deprecated* A legacy synonym for `strict`.
 *  `false` *Deprecated* A legacy synonym for `warn`.

The default is `strict`.

Note: If the JQL is not correctly formed a 400 response code is returned, regardless of the `validateQuery` value.

=cut

has 'validateQuery' => (
    is       => 'ro',
    isa      => Enum[
        "strict",
        "warn",
        "none",
        "true",
        "false",
    ],
);


1;
