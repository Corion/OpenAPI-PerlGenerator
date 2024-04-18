package JIRA::API::SimplifiedHierarchyLevel 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::SimplifiedHierarchyLevel -

=head1 SYNOPSIS

  my $obj = JIRA::API::SimplifiedHierarchyLevel->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< aboveLevelId >>

The ID of the level above this one in the hierarchy. This property is deprecated, see [Change notice: Removing hierarchy level IDs from next-gen APIs](https://developer.atlassian.com/cloud/jira/platform/change-notice-removing-hierarchy-level-ids-from-next-gen-apis/).

=cut

has 'aboveLevelId' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< belowLevelId >>

The ID of the level below this one in the hierarchy. This property is deprecated, see [Change notice: Removing hierarchy level IDs from next-gen APIs](https://developer.atlassian.com/cloud/jira/platform/change-notice-removing-hierarchy-level-ids-from-next-gen-apis/).

=cut

has 'belowLevelId' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< externalUuid >>

The external UUID of the hierarchy level. This property is deprecated, see [Change notice: Removing hierarchy level IDs from next-gen APIs](https://developer.atlassian.com/cloud/jira/platform/change-notice-removing-hierarchy-level-ids-from-next-gen-apis/).

=cut

has 'externalUuid' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< hierarchyLevelNumber >>

=cut

has 'hierarchyLevelNumber' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< id >>

The ID of the hierarchy level. This property is deprecated, see [Change notice: Removing hierarchy level IDs from next-gen APIs](https://developer.atlassian.com/cloud/jira/platform/change-notice-removing-hierarchy-level-ids-from-next-gen-apis/).

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< issueTypeIds >>

The issue types available in this hierarchy level.

=cut

has 'issueTypeIds' => (
    is       => 'ro',
    isa      => ArrayRef[Int],
);

=head2 C<< level >>

The level of this item in the hierarchy.

=cut

has 'level' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< name >>

The name of this hierarchy level.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< projectConfigurationId >>

The ID of the project configuration. This property is deprecated, see [Change oticen: Removing hierarchy level IDs from next-gen APIs](https://developer.atlassian.com/cloud/jira/platform/change-notice-removing-hierarchy-level-ids-from-next-gen-apis/).

=cut

has 'projectConfigurationId' => (
    is       => 'ro',
    isa      => Int,
);


1;
