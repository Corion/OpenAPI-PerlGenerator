package JIRA::API::ProjectIssueTypesHierarchyLevel 0.01;
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

JIRA::API::ProjectIssueTypesHierarchyLevel -

=head1 SYNOPSIS

  my $obj = JIRA::API::ProjectIssueTypesHierarchyLevel->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< entityId >>

The ID of the issue type hierarchy level. This property is deprecated, see [Change notice: Removing hierarchy level IDs from next-gen APIs](https://developer.atlassian.com/cloud/jira/platform/change-notice-removing-hierarchy-level-ids-from-next-gen-apis/).

=cut

has 'entityId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< issueTypes >>

The list of issue types in the hierarchy level.

=cut

has 'issueTypes' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< level >>

The level of the issue type hierarchy level.

=cut

has 'level' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< name >>

The name of the issue type hierarchy level.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);


1;
