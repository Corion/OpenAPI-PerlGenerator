package JIRA::API::CreateWorkflowTransitionRulesDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::CreateWorkflowTransitionRulesDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::CreateWorkflowTransitionRulesDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< conditions >>

The workflow conditions.

=cut

has 'conditions' => (
    is       => 'ro',
);

=head2 C<< postFunctions >>

The workflow post functions.

**Note:** The default post functions are always added to the *initial* transition, as in:

    "postFunctions": [
        {
            "type": "IssueCreateFunction"
        },
        {
            "type": "IssueReindexFunction"
        },
        {
            "type": "FireIssueEventFunction",
            "configuration": {
                "event": {
                    "id": "1",
                    "name": "issue_created"
                }
            }
        }
    ]

**Note:** The default post functions are always added to the *global* and *directed* transitions, as in:

    "postFunctions": [
        {
            "type": "UpdateIssueStatusFunction"
        },
        {
            "type": "CreateCommentFunction"
        },
        {
            "type": "GenerateChangeHistoryFunction"
        },
        {
            "type": "IssueReindexFunction"
        },
        {
            "type": "FireIssueEventFunction",
            "configuration": {
                "event": {
                    "id": "13",
                    "name": "issue_generic"
                }
            }
        }
    ]

=cut

has 'postFunctions' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< validators >>

The workflow validators.

**Note:** The default permission validator is always added to the *initial* transition, as in:

    "validators": [
        {
            "type": "PermissionValidator",
            "configuration": {
                "permissionKey": "CREATE_ISSUES"
            }
        }
    ]

=cut

has 'validators' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);


1;
