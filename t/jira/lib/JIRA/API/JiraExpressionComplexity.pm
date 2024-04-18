package JIRA::API::JiraExpressionComplexity 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::JiraExpressionComplexity -

=head1 SYNOPSIS

  my $obj = JIRA::API::JiraExpressionComplexity->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< expensiveOperations >>

Information that can be used to determine how many [expensive operations](https://developer.atlassian.com/cloud/jira/platform/jira-expressions/#expensive-operations) the evaluation of the expression will perform. This information may be a formula or number. For example:

 *  `issues.map(i => i.comments)` performs as many expensive operations as there are issues on the issues list. So this parameter returns `N`, where `N` is the size of issue list.
 *  `new Issue(10010).comments` gets comments for one issue, so its complexity is `2` (`1` to retrieve issue 10010 from the database plus `1` to get its comments).

=cut

has 'expensiveOperations' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< variables >>

Variables used in the formula, mapped to the parts of the expression they refer to.

=cut

has 'variables' => (
    is       => 'ro',
    isa      => Object,
);


1;
