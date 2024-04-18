package JIRA::API::CreateProjectDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::CreateProjectDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::CreateProjectDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< assigneeType >>

The default assignee when creating issues for this project.

=cut

has 'assigneeType' => (
    is       => 'ro',
    isa      => Enum[
        "PROJECT_LEAD",
        "UNASSIGNED",
    ],
);

=head2 C<< avatarId >>

An integer value for the project's avatar.

=cut

has 'avatarId' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< categoryId >>

The ID of the project's category. A complete list of category IDs is found using the [Get all project categories](#api-rest-api-3-projectCategory-get) operation.

=cut

has 'categoryId' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< description >>

A brief description of the project.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< fieldConfigurationScheme >>

The ID of the field configuration scheme for the project. Use the [Get all field configuration schemes](#api-rest-api-3-fieldconfigurationscheme-get) operation to get a list of field configuration scheme IDs. If you specify the field configuration scheme you cannot specify the project template key.

=cut

has 'fieldConfigurationScheme' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< issueSecurityScheme >>

The ID of the issue security scheme for the project, which enables you to control who can and cannot view issues. Use the [Get issue security schemes](#api-rest-api-3-issuesecurityschemes-get) resource to get all issue security scheme IDs.

=cut

has 'issueSecurityScheme' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< issueTypeScheme >>

The ID of the issue type scheme for the project. Use the [Get all issue type schemes](#api-rest-api-3-issuetypescheme-get) operation to get a list of issue type scheme IDs. If you specify the issue type scheme you cannot specify the project template key.

=cut

has 'issueTypeScheme' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< issueTypeScreenScheme >>

The ID of the issue type screen scheme for the project. Use the [Get all issue type screen schemes](#api-rest-api-3-issuetypescreenscheme-get) operation to get a list of issue type screen scheme IDs. If you specify the issue type screen scheme you cannot specify the project template key.

=cut

has 'issueTypeScreenScheme' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< key >>

Project keys must be unique and start with an uppercase letter followed by one or more uppercase alphanumeric characters. The maximum length is 10 characters.

=cut

has 'key' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< lead >>

This parameter is deprecated because of privacy changes. Use `leadAccountId` instead. See the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. The user name of the project lead. Either `lead` or `leadAccountId` must be set when creating a project. Cannot be provided with `leadAccountId`.

=cut

has 'lead' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< leadAccountId >>

The account ID of the project lead. Either `lead` or `leadAccountId` must be set when creating a project. Cannot be provided with `lead`.

=cut

has 'leadAccountId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the project.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< notificationScheme >>

The ID of the notification scheme for the project. Use the [Get notification schemes](#api-rest-api-3-notificationscheme-get) resource to get a list of notification scheme IDs.

=cut

has 'notificationScheme' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< permissionScheme >>

The ID of the permission scheme for the project. Use the [Get all permission schemes](#api-rest-api-3-permissionscheme-get) resource to see a list of all permission scheme IDs.

=cut

has 'permissionScheme' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< projectTemplateKey >>

A predefined configuration for a project. The type of the `projectTemplateKey` must match with the type of the `projectTypeKey`.

=cut

has 'projectTemplateKey' => (
    is       => 'ro',
    isa      => Enum[
        "com.pyxis.greenhopper.jira:gh-simplified-agility-kanban",
        "com.pyxis.greenhopper.jira:gh-simplified-agility-scrum",
        "com.pyxis.greenhopper.jira:gh-simplified-basic",
        "com.pyxis.greenhopper.jira:gh-simplified-kanban-classic",
        "com.pyxis.greenhopper.jira:gh-simplified-scrum-classic",
        "com.atlassian.servicedesk:simplified-it-service-management",
        "com.atlassian.servicedesk:simplified-general-service-desk",
        "com.atlassian.servicedesk:simplified-general-service-desk-it",
        "com.atlassian.servicedesk:simplified-general-service-desk-business",
        "com.atlassian.servicedesk:simplified-internal-service-desk",
        "com.atlassian.servicedesk:simplified-external-service-desk",
        "com.atlassian.servicedesk:simplified-hr-service-desk",
        "com.atlassian.servicedesk:simplified-facilities-service-desk",
        "com.atlassian.servicedesk:simplified-legal-service-desk",
        "com.atlassian.servicedesk:simplified-marketing-service-desk",
        "com.atlassian.servicedesk:simplified-finance-service-desk",
        "com.atlassian.servicedesk:simplified-analytics-service-desk",
        "com.atlassian.servicedesk:simplified-halp-service-desk",
        "com.atlassian.servicedesk:simplified-custom-project-service-desk",
        "com.atlassian.jira-core-project-templates:jira-core-simplified-content-management",
        "com.atlassian.jira-core-project-templates:jira-core-simplified-document-approval",
        "com.atlassian.jira-core-project-templates:jira-core-simplified-lead-tracking",
        "com.atlassian.jira-core-project-templates:jira-core-simplified-process-control",
        "com.atlassian.jira-core-project-templates:jira-core-simplified-procurement",
        "com.atlassian.jira-core-project-templates:jira-core-simplified-project-management",
        "com.atlassian.jira-core-project-templates:jira-core-simplified-recruitment",
        "com.atlassian.jira-core-project-templates:jira-core-simplified-task-",
    ],
);

=head2 C<< projectTypeKey >>

The [project type](https://confluence.atlassian.com/x/GwiiLQ#Jiraapplicationsoverview-Productfeaturesandprojecttypes), which defines the application-specific feature set. If you don't specify the project template you have to specify the project type.

=cut

has 'projectTypeKey' => (
    is       => 'ro',
    isa      => Enum[
        "software",
        "service_desk",
        "business",
    ],
);

=head2 C<< url >>

A link to information about this project, such as project documentation

=cut

has 'url' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< workflowScheme >>

The ID of the workflow scheme for the project. Use the [Get all workflow schemes](#api-rest-api-3-workflowscheme-get) operation to get a list of workflow scheme IDs. If you specify the workflow scheme you cannot specify the project template key.

=cut

has 'workflowScheme' => (
    is       => 'ro',
    isa      => Int,
);


1;
