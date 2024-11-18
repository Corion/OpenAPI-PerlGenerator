package JIRA::API::Client 0.01;
use 5.020;
use Moo 2;
use experimental 'signatures';

extends 'JIRA::API::Client::Impl';

=encoding utf8

=head1 NAME

JIRA::API::Client - Client for JIRA::API

=head1 SYNOPSIS

  use 5.020;
  use JIRA::API::Client;

  my $client = JIRA::API::Client->new(
      schema_file => '...',
      server => 'https://your-domain.atlassian.net',
  );
  my $res = $client->someMethod()->get;
  say $res;

=head1 METHODS

=head2 C<< getBanner >>

  my $res = $client->getBanner()->get;

Get announcement banner configuration

Returns a L<< JIRA::API::AnnouncementBannerConfiguration >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.

=cut

=head2 C<< setBanner >>

  my $res = $client->setBanner()->get;

Update announcement banner configuration

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns Hashref on HTTP code 204.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.

=cut

=head2 C<< updateMultipleCustomFieldValues >>

  my $res = $client->updateMultipleCustomFieldValues()->get;

Update custom fields

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getCustomFieldConfiguration >>

  my $res = $client->getCustomFieldConfiguration()->get;

Get custom field configurations

Returns a L<< JIRA::API::PageBeanContextualConfiguration >> on success.

=cut

=head2 C<< updateCustomFieldConfiguration >>

  my $res = $client->updateCustomFieldConfiguration()->get;

Update custom field configurations

Returns Hashref on success.

=cut

=head2 C<< updateCustomFieldValue >>

  my $res = $client->updateCustomFieldValue()->get;

Update custom field value

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getApplicationProperty >>

  my $res = $client->getApplicationProperty()->get;

Get application property

Returns an array of L<< JIRA::API::ApplicationProperty >> on success.

=cut

=head2 C<< getAdvancedSettings >>

  my $res = $client->getAdvancedSettings()->get;

Get advanced settings

Returns an array of L<< JIRA::API::ApplicationProperty >> on success.

=cut

=head2 C<< setApplicationProperty >>

  my $res = $client->setApplicationProperty()->get;

Set application property

Returns a L<< JIRA::API::ApplicationProperty >> on success.

=cut

=head2 C<< getAllApplicationRoles >>

  my $res = $client->getAllApplicationRoles()->get;

Get all application roles

Returns an array of L<< JIRA::API::ApplicationRole >> on success.

=cut

=head2 C<< getApplicationRole >>

  my $res = $client->getApplicationRole()->get;

Get application role

Returns a L<< JIRA::API::ApplicationRole >> on success.

=cut

=head2 C<< getAttachmentContent >>

  my $res = $client->getAttachmentContent()->get;

Get attachment content

Returns Hashref on success.

=cut

=head2 C<< getAttachmentMeta >>

  my $res = $client->getAttachmentMeta()->get;

Get Jira attachment settings

Returns a L<< JIRA::API::AttachmentSettings >> on success.

=cut

=head2 C<< getAttachmentThumbnail >>

  my $res = $client->getAttachmentThumbnail()->get;

Get attachment thumbnail

Returns Hashref on success.

=cut

=head2 C<< removeAttachment >>

  my $res = $client->removeAttachment()->get;

Delete attachment


=cut

=head2 C<< getAttachment >>

  my $res = $client->getAttachment()->get;

Get attachment metadata

Returns a L<< JIRA::API::AttachmentMetadata >> on success.

=cut

=head2 C<< expandAttachmentForHumans >>

  my $res = $client->expandAttachmentForHumans()->get;

Get all metadata for an expanded attachment

Returns a L<< JIRA::API::AttachmentArchiveMetadataReadable >> on success.

=cut

=head2 C<< expandAttachmentForMachines >>

  my $res = $client->expandAttachmentForMachines()->get;

Get contents metadata for an expanded attachment

Returns a L<< JIRA::API::AttachmentArchiveImpl >> on success.

=cut

=head2 C<< getAuditRecords >>

  my $res = $client->getAuditRecords()->get;

Get audit records

Returns a L<< JIRA::API::AuditRecords >> on success.

=cut

=head2 C<< getAllSystemAvatars >>

  my $res = $client->getAllSystemAvatars()->get;

Get system avatars by type

Returns a L<< JIRA::API::SystemAvatars >> on success.

=cut

=head2 C<< getCommentsByIds >>

  my $res = $client->getCommentsByIds()->get;

Get comments by IDs

Returns a L<< JIRA::API::PageBeanComment >> on success.

=cut

=head2 C<< getCommentPropertyKeys >>

  my $res = $client->getCommentPropertyKeys()->get;

Get comment property keys

Returns a L<< JIRA::API::PropertyKeys >> on success.

=cut

=head2 C<< deleteCommentProperty >>

  my $res = $client->deleteCommentProperty()->get;

Delete comment property


=cut

=head2 C<< getCommentProperty >>

  my $res = $client->getCommentProperty()->get;

Get comment property

Returns a L<< JIRA::API::EntityProperty >> on success.

=cut

=head2 C<< setCommentProperty >>

  my $res = $client->setCommentProperty()->get;

Set comment property

Returns Hashref on success.
Returns Hashref on HTTP code 201.

=cut

=head2 C<< createComponent >>

  my $res = $client->createComponent()->get;

Create component

Returns a L<< JIRA::API::ProjectComponent >> on HTTP code 201.

=cut

=head2 C<< deleteComponent >>

  my $res = $client->deleteComponent()->get;

Delete component


=cut

=head2 C<< getComponent >>

  my $res = $client->getComponent()->get;

Get component

Returns a L<< JIRA::API::ProjectComponent >> on success.

=cut

=head2 C<< updateComponent >>

  my $res = $client->updateComponent()->get;

Update component

Returns a L<< JIRA::API::ProjectComponent >> on success.

=cut

=head2 C<< getComponentRelatedIssues >>

  my $res = $client->getComponentRelatedIssues()->get;

Get component issues count

Returns a L<< JIRA::API::ComponentIssuesCount >> on success.

=cut

=head2 C<< getConfiguration >>

  my $res = $client->getConfiguration()->get;

Get global settings

Returns a L<< JIRA::API::Configuration >> on success.

=cut

=head2 C<< getSelectedTimeTrackingImplementation >>

  my $res = $client->getSelectedTimeTrackingImplementation()->get;

Get selected time tracking provider

Returns a L<< JIRA::API::TimeTrackingProvider >> on success.
Returns Hashref on HTTP code 204.

=cut

=head2 C<< selectTimeTrackingImplementation >>

  my $res = $client->selectTimeTrackingImplementation()->get;

Select time tracking provider

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getAvailableTimeTrackingImplementations >>

  my $res = $client->getAvailableTimeTrackingImplementations()->get;

Get all time tracking providers

Returns an array of L<< JIRA::API::TimeTrackingProvider >> on success.

=cut

=head2 C<< getSharedTimeTrackingConfiguration >>

  my $res = $client->getSharedTimeTrackingConfiguration()->get;

Get time tracking settings

Returns a L<< JIRA::API::TimeTrackingConfiguration >> on success.

=cut

=head2 C<< setSharedTimeTrackingConfiguration >>

  my $res = $client->setSharedTimeTrackingConfiguration()->get;

Set time tracking settings

Returns a L<< JIRA::API::TimeTrackingConfiguration >> on success.

=cut

=head2 C<< getCustomFieldOption >>

  my $res = $client->getCustomFieldOption()->get;

Get custom field option

Returns a L<< JIRA::API::CustomFieldOption >> on success.

=cut

=head2 C<< getAllDashboards >>

  my $res = $client->getAllDashboards()->get;

Get all dashboards

Returns a L<< JIRA::API::PageOfDashboards >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.

=cut

=head2 C<< createDashboard >>

  my $res = $client->createDashboard()->get;

Create dashboard

Returns a L<< JIRA::API::Dashboard >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.

=cut

=head2 C<< getAllAvailableDashboardGadgets >>

  my $res = $client->getAllAvailableDashboardGadgets()->get;

Get available gadgets

Returns a L<< JIRA::API::AvailableDashboardGadgetsResponse >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.

=cut

=head2 C<< getDashboardsPaginated >>

  my $res = $client->getDashboardsPaginated()->get;

Search for dashboards

Returns a L<< JIRA::API::PageBeanDashboard >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.

=cut

=head2 C<< getAllGadgets >>

  my $res = $client->getAllGadgets()->get;

Get gadgets

Returns a L<< JIRA::API::DashboardGadgetResponse >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< addGadget >>

  my $res = $client->addGadget()->get;

Add gadget to dashboard

Returns a L<< JIRA::API::DashboardGadget >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< removeGadget >>

  my $res = $client->removeGadget()->get;

Remove gadget from dashboard

Returns Hashref on HTTP code 204.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< updateGadget >>

  my $res = $client->updateGadget()->get;

Update gadget on dashboard

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns Hashref on HTTP code 204.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< getDashboardItemPropertyKeys >>

  my $res = $client->getDashboardItemPropertyKeys()->get;

Get dashboard item property keys

Returns a L<< JIRA::API::PropertyKeys >> on success.

=cut

=head2 C<< deleteDashboardItemProperty >>

  my $res = $client->deleteDashboardItemProperty()->get;

Delete dashboard item property


=cut

=head2 C<< getDashboardItemProperty >>

  my $res = $client->getDashboardItemProperty()->get;

Get dashboard item property

Returns a L<< JIRA::API::EntityProperty >> on success.

=cut

=head2 C<< setDashboardItemProperty >>

  my $res = $client->setDashboardItemProperty()->get;

Set dashboard item property

Returns Hashref on success.
Returns Hashref on HTTP code 201.

=cut

=head2 C<< deleteDashboard >>

  my $res = $client->deleteDashboard()->get;

Delete dashboard

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.

=cut

=head2 C<< getDashboard >>

  my $res = $client->getDashboard()->get;

Get dashboard

Returns a L<< JIRA::API::Dashboard >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.

=cut

=head2 C<< updateDashboard >>

  my $res = $client->updateDashboard()->get;

Update dashboard

Returns a L<< JIRA::API::Dashboard >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< copyDashboard >>

  my $res = $client->copyDashboard()->get;

Copy dashboard

Returns a L<< JIRA::API::Dashboard >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< getEvents >>

  my $res = $client->getEvents()->get;

Get events

Returns an array of L<< JIRA::API::IssueEvent >> on success.

=cut

=head2 C<< analyseExpression >>

  my $res = $client->analyseExpression()->get;

Analyse Jira expression

Returns a L<< JIRA::API::JiraExpressionsAnalysis >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< evaluateJiraExpression >>

  my $res = $client->evaluateJiraExpression()->get;

Evaluate Jira expression

Returns a L<< JIRA::API::JiraExpressionResult >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< getFields >>

  my $res = $client->getFields()->get;

Get fields

Returns an array of L<< JIRA::API::FieldDetails >> on success.

=cut

=head2 C<< createCustomField >>

  my $res = $client->createCustomField()->get;

Create custom field

Returns a L<< JIRA::API::FieldDetails >> on HTTP code 201.

=cut

=head2 C<< getFieldsPaginated >>

  my $res = $client->getFieldsPaginated()->get;

Get fields paginated

Returns a L<< JIRA::API::PageBeanField >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.

=cut

=head2 C<< getTrashedFieldsPaginated >>

  my $res = $client->getTrashedFieldsPaginated()->get;

Get fields in trash paginated

Returns a L<< JIRA::API::PageBeanField >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.

=cut

=head2 C<< updateCustomField >>

  my $res = $client->updateCustomField()->get;

Update custom field

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getContextsForField >>

  my $res = $client->getContextsForField()->get;

Get custom field contexts

Returns a L<< JIRA::API::PageBeanCustomFieldContext >> on success.

=cut

=head2 C<< createCustomFieldContext >>

  my $res = $client->createCustomFieldContext()->get;

Create custom field context

Returns a L<< JIRA::API::CreateCustomFieldContext >> on HTTP code 201.

=cut

=head2 C<< getDefaultValues >>

  my $res = $client->getDefaultValues()->get;

Get custom field contexts default values

Returns a L<< JIRA::API::PageBeanCustomFieldContextDefaultValue >> on success.

=cut

=head2 C<< setDefaultValues >>

  my $res = $client->setDefaultValues()->get;

Set custom field contexts default values

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getIssueTypeMappingsForContexts >>

  my $res = $client->getIssueTypeMappingsForContexts()->get;

Get issue types for custom field context

Returns a L<< JIRA::API::PageBeanIssueTypeToContextMapping >> on success.

=cut

=head2 C<< getCustomFieldContextsForProjectsAndIssueTypes >>

  my $res = $client->getCustomFieldContextsForProjectsAndIssueTypes()->get;

Get custom field contexts for projects and issue types

Returns a L<< JIRA::API::PageBeanContextForProjectAndIssueType >> on success.

=cut

=head2 C<< getProjectContextMapping >>

  my $res = $client->getProjectContextMapping()->get;

Get project mappings for custom field context

Returns a L<< JIRA::API::PageBeanCustomFieldContextProjectMapping >> on success.

=cut

=head2 C<< deleteCustomFieldContext >>

  my $res = $client->deleteCustomFieldContext()->get;

Delete custom field context

Returns Hashref on HTTP code 204.

=cut

=head2 C<< updateCustomFieldContext >>

  my $res = $client->updateCustomFieldContext()->get;

Update custom field context

Returns Hashref on HTTP code 204.

=cut

=head2 C<< addIssueTypesToContext >>

  my $res = $client->addIssueTypesToContext()->get;

Add issue types to context

Returns Hashref on HTTP code 204.

=cut

=head2 C<< removeIssueTypesFromContext >>

  my $res = $client->removeIssueTypesFromContext()->get;

Remove issue types from context

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getOptionsForContext >>

  my $res = $client->getOptionsForContext()->get;

Get custom field options (context)

Returns a L<< JIRA::API::PageBeanCustomFieldContextOption >> on success.

=cut

=head2 C<< createCustomFieldOption >>

  my $res = $client->createCustomFieldOption()->get;

Create custom field options (context)

Returns a L<< JIRA::API::CustomFieldCreatedContextOptionsList >> on success.

=cut

=head2 C<< updateCustomFieldOption >>

  my $res = $client->updateCustomFieldOption()->get;

Update custom field options (context)

Returns a L<< JIRA::API::CustomFieldUpdatedContextOptionsList >> on success.

=cut

=head2 C<< reorderCustomFieldOptions >>

  my $res = $client->reorderCustomFieldOptions()->get;

Reorder custom field options (context)

Returns Hashref on HTTP code 204.

=cut

=head2 C<< deleteCustomFieldOption >>

  my $res = $client->deleteCustomFieldOption()->get;

Delete custom field options (context)


=cut

=head2 C<< assignProjectsToCustomFieldContext >>

  my $res = $client->assignProjectsToCustomFieldContext()->get;

Assign custom field context to projects

Returns Hashref on HTTP code 204.

=cut

=head2 C<< removeCustomFieldContextFromProjects >>

  my $res = $client->removeCustomFieldContextFromProjects()->get;

Remove custom field context from projects

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getContextsForFieldDeprecated >>

  my $res = $client->getContextsForFieldDeprecated()->get;

Get contexts for a field

Returns a L<< JIRA::API::PageBeanContext >> on success.

=cut

=head2 C<< getScreensForField >>

  my $res = $client->getScreensForField()->get;

Get screens for a field

Returns a L<< JIRA::API::PageBeanScreenWithTab >> on success.

=cut

=head2 C<< getAllIssueFieldOptions >>

  my $res = $client->getAllIssueFieldOptions()->get;

Get all issue field options

Returns a L<< JIRA::API::PageBeanIssueFieldOption >> on success.

=cut

=head2 C<< createIssueFieldOption >>

  my $res = $client->createIssueFieldOption()->get;

Create issue field option

Returns a L<< JIRA::API::IssueFieldOption >> on success.

=cut

=head2 C<< getSelectableIssueFieldOptions >>

  my $res = $client->getSelectableIssueFieldOptions()->get;

Get selectable issue field options

Returns a L<< JIRA::API::PageBeanIssueFieldOption >> on success.

=cut

=head2 C<< getVisibleIssueFieldOptions >>

  my $res = $client->getVisibleIssueFieldOptions()->get;

Get visible issue field options

Returns a L<< JIRA::API::PageBeanIssueFieldOption >> on success.

=cut

=head2 C<< deleteIssueFieldOption >>

  my $res = $client->deleteIssueFieldOption()->get;

Delete issue field option

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getIssueFieldOption >>

  my $res = $client->getIssueFieldOption()->get;

Get issue field option

Returns a L<< JIRA::API::IssueFieldOption >> on success.

=cut

=head2 C<< updateIssueFieldOption >>

  my $res = $client->updateIssueFieldOption()->get;

Update issue field option

Returns a L<< JIRA::API::IssueFieldOption >> on success.

=cut

=head2 C<< replaceIssueFieldOption >>

  my $res = $client->replaceIssueFieldOption()->get;

Replace issue field option

Returns a L<< JIRA::API::TaskProgressBeanRemoveOptionFromIssuesResult >> on HTTP code 303.

=cut

=head2 C<< deleteCustomField >>

  my $res = $client->deleteCustomField()->get;

Delete custom field

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::TaskProgressBeanObject >> on HTTP code 303.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 409.

=cut

=head2 C<< restoreCustomField >>

  my $res = $client->restoreCustomField()->get;

Restore custom field from trash

Returns Hashref on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< trashCustomField >>

  my $res = $client->trashCustomField()->get;

Move custom field to trash

Returns Hashref on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< getAllFieldConfigurations >>

  my $res = $client->getAllFieldConfigurations()->get;

Get all field configurations

Returns a L<< JIRA::API::PageBeanFieldConfigurationDetails >> on success.

=cut

=head2 C<< createFieldConfiguration >>

  my $res = $client->createFieldConfiguration()->get;

Create field configuration

Returns a L<< JIRA::API::FieldConfiguration >> on success.

=cut

=head2 C<< deleteFieldConfiguration >>

  my $res = $client->deleteFieldConfiguration()->get;

Delete field configuration

Returns Hashref on HTTP code 204.

=cut

=head2 C<< updateFieldConfiguration >>

  my $res = $client->updateFieldConfiguration()->get;

Update field configuration

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getFieldConfigurationItems >>

  my $res = $client->getFieldConfigurationItems()->get;

Get field configuration items

Returns a L<< JIRA::API::PageBeanFieldConfigurationItem >> on success.

=cut

=head2 C<< updateFieldConfigurationItems >>

  my $res = $client->updateFieldConfigurationItems()->get;

Update field configuration items

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getAllFieldConfigurationSchemes >>

  my $res = $client->getAllFieldConfigurationSchemes()->get;

Get all field configuration schemes

Returns a L<< JIRA::API::PageBeanFieldConfigurationScheme >> on success.

=cut

=head2 C<< createFieldConfigurationScheme >>

  my $res = $client->createFieldConfigurationScheme()->get;

Create field configuration scheme

Returns a L<< JIRA::API::FieldConfigurationScheme >> on HTTP code 201.

=cut

=head2 C<< getFieldConfigurationSchemeMappings >>

  my $res = $client->getFieldConfigurationSchemeMappings()->get;

Get field configuration issue type items

Returns a L<< JIRA::API::PageBeanFieldConfigurationIssueTypeItem >> on success.

=cut

=head2 C<< getFieldConfigurationSchemeProjectMapping >>

  my $res = $client->getFieldConfigurationSchemeProjectMapping()->get;

Get field configuration schemes for projects

Returns a L<< JIRA::API::PageBeanFieldConfigurationSchemeProjects >> on success.

=cut

=head2 C<< assignFieldConfigurationSchemeToProject >>

  my $res = $client->assignFieldConfigurationSchemeToProject()->get;

Assign field configuration scheme to project

Returns Hashref on HTTP code 204.

=cut

=head2 C<< deleteFieldConfigurationScheme >>

  my $res = $client->deleteFieldConfigurationScheme()->get;

Delete field configuration scheme

Returns Hashref on HTTP code 204.

=cut

=head2 C<< updateFieldConfigurationScheme >>

  my $res = $client->updateFieldConfigurationScheme()->get;

Update field configuration scheme

Returns Hashref on HTTP code 204.

=cut

=head2 C<< setFieldConfigurationSchemeMapping >>

  my $res = $client->setFieldConfigurationSchemeMapping()->get;

Assign issue types to field configurations

Returns Hashref on HTTP code 204.

=cut

=head2 C<< removeIssueTypesFromGlobalFieldConfigurationScheme >>

  my $res = $client->removeIssueTypesFromGlobalFieldConfigurationScheme()->get;

Remove issue types from field configuration scheme

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns Hashref on HTTP code 204.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< getFilters >>

  my $res = $client->getFilters()->get;

Get filters

Returns an array of L<< JIRA::API::Filter >> on success.

=cut

=head2 C<< createFilter >>

  my $res = $client->createFilter()->get;

Create filter

Returns a L<< JIRA::API::Filter >> on success.

=cut

=head2 C<< getDefaultShareScope >>

  my $res = $client->getDefaultShareScope()->get;

Get default share scope

Returns a L<< JIRA::API::DefaultShareScope >> on success.

=cut

=head2 C<< setDefaultShareScope >>

  my $res = $client->setDefaultShareScope()->get;

Set default share scope

Returns a L<< JIRA::API::DefaultShareScope >> on success.

=cut

=head2 C<< getFavouriteFilters >>

  my $res = $client->getFavouriteFilters()->get;

Get favorite filters

Returns an array of L<< JIRA::API::Filter >> on success.

=cut

=head2 C<< getMyFilters >>

  my $res = $client->getMyFilters()->get;

Get my filters

Returns an array of L<< JIRA::API::Filter >> on success.

=cut

=head2 C<< getFiltersPaginated >>

  my $res = $client->getFiltersPaginated()->get;

Search for filters

Returns a L<< JIRA::API::PageBeanFilterDetails >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.

=cut

=head2 C<< deleteFilter >>

  my $res = $client->deleteFilter()->get;

Delete filter


=cut

=head2 C<< getFilter >>

  my $res = $client->getFilter()->get;

Get filter

Returns a L<< JIRA::API::Filter >> on success.

=cut

=head2 C<< updateFilter >>

  my $res = $client->updateFilter()->get;

Update filter

Returns a L<< JIRA::API::Filter >> on success.

=cut

=head2 C<< resetColumns >>

  my $res = $client->resetColumns()->get;

Reset columns


=cut

=head2 C<< getColumns >>

  my $res = $client->getColumns()->get;

Get columns

Returns an array of L<< JIRA::API::ColumnItem >> on success.

=cut

=head2 C<< setColumns >>

  my $res = $client->setColumns()->get;

Set columns

Returns Hashref on success.

=cut

=head2 C<< deleteFavouriteForFilter >>

  my $res = $client->deleteFavouriteForFilter()->get;

Remove filter as favorite

Returns a L<< JIRA::API::Filter >> on success.

=cut

=head2 C<< setFavouriteForFilter >>

  my $res = $client->setFavouriteForFilter()->get;

Add filter as favorite

Returns a L<< JIRA::API::Filter >> on success.

=cut

=head2 C<< changeFilterOwner >>

  my $res = $client->changeFilterOwner()->get;

Change filter owner

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getSharePermissions >>

  my $res = $client->getSharePermissions()->get;

Get share permissions

Returns an array of L<< JIRA::API::SharePermission >> on success.

=cut

=head2 C<< addSharePermission >>

  my $res = $client->addSharePermission()->get;

Add share permission

Returns an array of L<< JIRA::API::SharePermission >> on HTTP code 201.

=cut

=head2 C<< deleteSharePermission >>

  my $res = $client->deleteSharePermission()->get;

Delete share permission


=cut

=head2 C<< getSharePermission >>

  my $res = $client->getSharePermission()->get;

Get share permission

Returns a L<< JIRA::API::SharePermission >> on success.

=cut

=head2 C<< removeGroup >>

  my $res = $client->removeGroup()->get;

Remove group


=cut

=head2 C<< getGroup >>

  my $res = $client->getGroup()->get;

Get group

Returns a L<< JIRA::API::Group >> on success.

=cut

=head2 C<< createGroup >>

  my $res = $client->createGroup()->get;

Create group

Returns a L<< JIRA::API::Group >> on HTTP code 201.

=cut

=head2 C<< bulkGetGroups >>

  my $res = $client->bulkGetGroups()->get;

Bulk get groups

Returns a L<< JIRA::API::PageBeanGroupDetails >> on success.

=cut

=head2 C<< getUsersFromGroup >>

  my $res = $client->getUsersFromGroup()->get;

Get users from group

Returns a L<< JIRA::API::PageBeanUserDetails >> on success.

=cut

=head2 C<< removeUserFromGroup >>

  my $res = $client->removeUserFromGroup()->get;

Remove user from group


=cut

=head2 C<< addUserToGroup >>

  my $res = $client->addUserToGroup()->get;

Add user to group

Returns a L<< JIRA::API::Group >> on HTTP code 201.

=cut

=head2 C<< findGroups >>

  my $res = $client->findGroups()->get;

Find groups

Returns a L<< JIRA::API::FoundGroups >> on success.

=cut

=head2 C<< findUsersAndGroups >>

  my $res = $client->findUsersAndGroups()->get;

Find users and groups

Returns a L<< JIRA::API::FoundUsersAndGroups >> on success.

=cut

=head2 C<< getLicense >>

  my $res = $client->getLicense()->get;

Get license

Returns a L<< JIRA::API::License >> on success.

=cut

=head2 C<< createIssue >>

  my $res = $client->createIssue()->get;

Create issue

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::CreatedIssue >> on HTTP code 201.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.

=cut

=head2 C<< createIssues >>

  my $res = $client->createIssues()->get;

Bulk create issue

Returns a L<< JIRA::API::CreatedIssues >> on error.
Returns a L<< JIRA::API::CreatedIssues >> on HTTP code 201.

=cut

=head2 C<< getCreateIssueMeta >>

  my $res = $client->getCreateIssueMeta()->get;

Get create issue metadata

Returns a L<< JIRA::API::IssueCreateMetadata >> on success.

=cut

=head2 C<< getIssuePickerResource >>

  my $res = $client->getIssuePickerResource()->get;

Get issue picker suggestions

Returns a L<< JIRA::API::IssuePickerSuggestions >> on success.

=cut

=head2 C<< bulkSetIssuesPropertiesList >>

  my $res = $client->bulkSetIssuesPropertiesList()->get;

Bulk set issues properties by list

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.

=cut

=head2 C<< bulkSetIssuePropertiesByIssue >>

  my $res = $client->bulkSetIssuePropertiesByIssue()->get;

Bulk set issue properties by issue

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.

=cut

=head2 C<< bulkDeleteIssueProperty >>

  my $res = $client->bulkDeleteIssueProperty()->get;

Bulk delete issue property

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.

=cut

=head2 C<< bulkSetIssueProperty >>

  my $res = $client->bulkSetIssueProperty()->get;

Bulk set issue property

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.

=cut

=head2 C<< getIsWatchingIssueBulk >>

  my $res = $client->getIsWatchingIssueBulk()->get;

Get is watching issue bulk

Returns a L<< JIRA::API::BulkIssueIsWatching >> on success.

=cut

=head2 C<< deleteIssue >>

  my $res = $client->deleteIssue()->get;

Delete issue


=cut

=head2 C<< getIssue >>

  my $res = $client->getIssue()->get;

Get issue

Returns a L<< JIRA::API::IssueBean >> on success.

=cut

=head2 C<< editIssue >>

  my $res = $client->editIssue()->get;

Edit issue

Returns Hashref on HTTP code 204.

=cut

=head2 C<< assignIssue >>

  my $res = $client->assignIssue()->get;

Assign issue

Returns Hashref on HTTP code 204.

=cut

=head2 C<< addAttachment >>

  my $res = $client->addAttachment()->get;

Add attachment

Returns an array of L<< JIRA::API::Attachment >> on success.

=cut

=head2 C<< getChangeLogs >>

  my $res = $client->getChangeLogs()->get;

Get changelogs

Returns a L<< JIRA::API::PageBeanChangelog >> on success.

=cut

=head2 C<< getChangeLogsByIds >>

  my $res = $client->getChangeLogsByIds()->get;

Get changelogs by IDs

Returns a L<< JIRA::API::PageOfChangelogs >> on success.

=cut

=head2 C<< getComments >>

  my $res = $client->getComments()->get;

Get comments

Returns a L<< JIRA::API::PageOfComments >> on success.

=cut

=head2 C<< addComment >>

  my $res = $client->addComment()->get;

Add comment

Returns a L<< JIRA::API::Comment >> on HTTP code 201.

=cut

=head2 C<< deleteComment >>

  my $res = $client->deleteComment()->get;

Delete comment


=cut

=head2 C<< getComment >>

  my $res = $client->getComment()->get;

Get comment

Returns a L<< JIRA::API::Comment >> on success.

=cut

=head2 C<< updateComment >>

  my $res = $client->updateComment()->get;

Update comment

Returns a L<< JIRA::API::Comment >> on success.

=cut

=head2 C<< getEditIssueMeta >>

  my $res = $client->getEditIssueMeta()->get;

Get edit issue metadata

Returns a L<< JIRA::API::IssueUpdateMetadata >> on success.

=cut

=head2 C<< notify >>

  my $res = $client->notify()->get;

Send notification for issue

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getIssuePropertyKeys >>

  my $res = $client->getIssuePropertyKeys()->get;

Get issue property keys

Returns a L<< JIRA::API::PropertyKeys >> on success.

=cut

=head2 C<< deleteIssueProperty >>

  my $res = $client->deleteIssueProperty()->get;

Delete issue property


=cut

=head2 C<< getIssueProperty >>

  my $res = $client->getIssueProperty()->get;

Get issue property

Returns a L<< JIRA::API::EntityProperty >> on success.

=cut

=head2 C<< setIssueProperty >>

  my $res = $client->setIssueProperty()->get;

Set issue property

Returns Hashref on success.
Returns Hashref on HTTP code 201.

=cut

=head2 C<< deleteRemoteIssueLinkByGlobalId >>

  my $res = $client->deleteRemoteIssueLinkByGlobalId()->get;

Delete remote issue link by global ID


=cut

=head2 C<< getRemoteIssueLinks >>

  my $res = $client->getRemoteIssueLinks()->get;

Get remote issue links

Returns a L<< JIRA::API::RemoteIssueLink >> on success.

=cut

=head2 C<< createOrUpdateRemoteIssueLink >>

  my $res = $client->createOrUpdateRemoteIssueLink()->get;

Create or update remote issue link

Returns a L<< JIRA::API::RemoteIssueLinkIdentifies >> on success.
Returns a L<< JIRA::API::RemoteIssueLinkIdentifies >> on HTTP code 201.

=cut

=head2 C<< deleteRemoteIssueLinkById >>

  my $res = $client->deleteRemoteIssueLinkById()->get;

Delete remote issue link by ID


=cut

=head2 C<< getRemoteIssueLinkById >>

  my $res = $client->getRemoteIssueLinkById()->get;

Get remote issue link by ID

Returns a L<< JIRA::API::RemoteIssueLink >> on success.

=cut

=head2 C<< updateRemoteIssueLink >>

  my $res = $client->updateRemoteIssueLink()->get;

Update remote issue link by ID

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getTransitions >>

  my $res = $client->getTransitions()->get;

Get transitions

Returns a L<< JIRA::API::Transitions >> on success.

=cut

=head2 C<< doTransition >>

  my $res = $client->doTransition()->get;

Transition issue

Returns Hashref on HTTP code 204.

=cut

=head2 C<< removeVote >>

  my $res = $client->removeVote()->get;

Delete vote


=cut

=head2 C<< getVotes >>

  my $res = $client->getVotes()->get;

Get votes

Returns a L<< JIRA::API::Votes >> on success.

=cut

=head2 C<< addVote >>

  my $res = $client->addVote()->get;

Add vote

Returns Hashref on HTTP code 204.

=cut

=head2 C<< removeWatcher >>

  my $res = $client->removeWatcher()->get;

Delete watcher


=cut

=head2 C<< getIssueWatchers >>

  my $res = $client->getIssueWatchers()->get;

Get issue watchers

Returns a L<< JIRA::API::Watchers >> on success.

=cut

=head2 C<< addWatcher >>

  my $res = $client->addWatcher()->get;

Add watcher

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getIssueWorklog >>

  my $res = $client->getIssueWorklog()->get;

Get issue worklogs

Returns a L<< JIRA::API::PageOfWorklogs >> on success.

=cut

=head2 C<< addWorklog >>

  my $res = $client->addWorklog()->get;

Add worklog

Returns a L<< JIRA::API::Worklog >> on HTTP code 201.

=cut

=head2 C<< deleteWorklog >>

  my $res = $client->deleteWorklog()->get;

Delete worklog


=cut

=head2 C<< getWorklog >>

  my $res = $client->getWorklog()->get;

Get worklog

Returns a L<< JIRA::API::Worklog >> on success.

=cut

=head2 C<< updateWorklog >>

  my $res = $client->updateWorklog()->get;

Update worklog

Returns a L<< JIRA::API::Worklog >> on success.

=cut

=head2 C<< getWorklogPropertyKeys >>

  my $res = $client->getWorklogPropertyKeys()->get;

Get worklog property keys

Returns a L<< JIRA::API::PropertyKeys >> on success.

=cut

=head2 C<< deleteWorklogProperty >>

  my $res = $client->deleteWorklogProperty()->get;

Delete worklog property


=cut

=head2 C<< getWorklogProperty >>

  my $res = $client->getWorklogProperty()->get;

Get worklog property

Returns a L<< JIRA::API::EntityProperty >> on success.

=cut

=head2 C<< setWorklogProperty >>

  my $res = $client->setWorklogProperty()->get;

Set worklog property

Returns Hashref on success.
Returns Hashref on HTTP code 201.

=cut

=head2 C<< linkIssues >>

  my $res = $client->linkIssues()->get;

Create issue link

Returns Hashref on HTTP code 201.

=cut

=head2 C<< deleteIssueLink >>

  my $res = $client->deleteIssueLink()->get;

Delete issue link


=cut

=head2 C<< getIssueLink >>

  my $res = $client->getIssueLink()->get;

Get issue link

Returns a L<< JIRA::API::IssueLink >> on success.

=cut

=head2 C<< getIssueLinkTypes >>

  my $res = $client->getIssueLinkTypes()->get;

Get issue link types

Returns a L<< JIRA::API::IssueLinkTypes >> on success.

=cut

=head2 C<< createIssueLinkType >>

  my $res = $client->createIssueLinkType()->get;

Create issue link type

Returns a L<< JIRA::API::IssueLinkType >> on HTTP code 201.

=cut

=head2 C<< deleteIssueLinkType >>

  my $res = $client->deleteIssueLinkType()->get;

Delete issue link type


=cut

=head2 C<< getIssueLinkType >>

  my $res = $client->getIssueLinkType()->get;

Get issue link type

Returns a L<< JIRA::API::IssueLinkType >> on success.

=cut

=head2 C<< updateIssueLinkType >>

  my $res = $client->updateIssueLinkType()->get;

Update issue link type

Returns a L<< JIRA::API::IssueLinkType >> on success.

=cut

=head2 C<< getIssueSecuritySchemes >>

  my $res = $client->getIssueSecuritySchemes()->get;

Get issue security schemes

Returns a L<< JIRA::API::SecuritySchemes >> on success.

=cut

=head2 C<< getIssueSecurityScheme >>

  my $res = $client->getIssueSecurityScheme()->get;

Get issue security scheme

Returns a L<< JIRA::API::SecurityScheme >> on success.

=cut

=head2 C<< getIssueSecurityLevelMembers >>

  my $res = $client->getIssueSecurityLevelMembers()->get;

Get issue security level members

Returns a L<< JIRA::API::PageBeanIssueSecurityLevelMember >> on success.

=cut

=head2 C<< getIssueAllTypes >>

  my $res = $client->getIssueAllTypes()->get;

Get all issue types for user

Returns an array of L<< JIRA::API::IssueTypeDetails >> on success.

=cut

=head2 C<< createIssueType >>

  my $res = $client->createIssueType()->get;

Create issue type

Returns a L<< JIRA::API::IssueTypeDetails >> on HTTP code 201.

=cut

=head2 C<< getIssueTypesForProject >>

  my $res = $client->getIssueTypesForProject()->get;

Get issue types for project

Returns an array of L<< JIRA::API::IssueTypeDetails >> on success.

=cut

=head2 C<< deleteIssueType >>

  my $res = $client->deleteIssueType()->get;

Delete issue type


=cut

=head2 C<< getIssueType >>

  my $res = $client->getIssueType()->get;

Get issue type

Returns a L<< JIRA::API::IssueTypeDetails >> on success.

=cut

=head2 C<< updateIssueType >>

  my $res = $client->updateIssueType()->get;

Update issue type

Returns a L<< JIRA::API::IssueTypeDetails >> on success.

=cut

=head2 C<< getAlternativeIssueTypes >>

  my $res = $client->getAlternativeIssueTypes()->get;

Get alternative issue types

Returns an array of L<< JIRA::API::IssueTypeDetails >> on success.

=cut

=head2 C<< createIssueTypeAvatar >>

  my $res = $client->createIssueTypeAvatar()->get;

Load issue type avatar

Returns a L<< JIRA::API::Avatar >> on HTTP code 201.

=cut

=head2 C<< getIssueTypePropertyKeys >>

  my $res = $client->getIssueTypePropertyKeys()->get;

Get issue type property keys

Returns a L<< JIRA::API::PropertyKeys >> on success.

=cut

=head2 C<< deleteIssueTypeProperty >>

  my $res = $client->deleteIssueTypeProperty()->get;

Delete issue type property


=cut

=head2 C<< getIssueTypeProperty >>

  my $res = $client->getIssueTypeProperty()->get;

Get issue type property

Returns a L<< JIRA::API::EntityProperty >> on success.

=cut

=head2 C<< setIssueTypeProperty >>

  my $res = $client->setIssueTypeProperty()->get;

Set issue type property

Returns Hashref on success.
Returns Hashref on HTTP code 201.

=cut

=head2 C<< getAllIssueTypeSchemes >>

  my $res = $client->getAllIssueTypeSchemes()->get;

Get all issue type schemes

Returns a L<< JIRA::API::PageBeanIssueTypeScheme >> on success.

=cut

=head2 C<< createIssueTypeScheme >>

  my $res = $client->createIssueTypeScheme()->get;

Create issue type scheme

Returns a L<< JIRA::API::IssueTypeSchemeID >> on HTTP code 201.

=cut

=head2 C<< getIssueTypeSchemesMapping >>

  my $res = $client->getIssueTypeSchemesMapping()->get;

Get issue type scheme items

Returns a L<< JIRA::API::PageBeanIssueTypeSchemeMapping >> on success.

=cut

=head2 C<< getIssueTypeSchemeForProjects >>

  my $res = $client->getIssueTypeSchemeForProjects()->get;

Get issue type schemes for projects

Returns a L<< JIRA::API::PageBeanIssueTypeSchemeProjects >> on success.

=cut

=head2 C<< assignIssueTypeSchemeToProject >>

  my $res = $client->assignIssueTypeSchemeToProject()->get;

Assign issue type scheme to project

Returns Hashref on HTTP code 204.

=cut

=head2 C<< deleteIssueTypeScheme >>

  my $res = $client->deleteIssueTypeScheme()->get;

Delete issue type scheme

Returns Hashref on HTTP code 204.

=cut

=head2 C<< updateIssueTypeScheme >>

  my $res = $client->updateIssueTypeScheme()->get;

Update issue type scheme

Returns Hashref on HTTP code 204.

=cut

=head2 C<< addIssueTypesToIssueTypeScheme >>

  my $res = $client->addIssueTypesToIssueTypeScheme()->get;

Add issue types to issue type scheme

Returns Hashref on HTTP code 204.

=cut

=head2 C<< reorderIssueTypesInIssueTypeScheme >>

  my $res = $client->reorderIssueTypesInIssueTypeScheme()->get;

Change order of issue types

Returns Hashref on HTTP code 204.

=cut

=head2 C<< removeIssueTypeFromIssueTypeScheme >>

  my $res = $client->removeIssueTypeFromIssueTypeScheme()->get;

Remove issue type from issue type scheme

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getIssueTypeScreenSchemes >>

  my $res = $client->getIssueTypeScreenSchemes()->get;

Get issue type screen schemes

Returns a L<< JIRA::API::PageBeanIssueTypeScreenScheme >> on success.

=cut

=head2 C<< createIssueTypeScreenScheme >>

  my $res = $client->createIssueTypeScreenScheme()->get;

Create issue type screen scheme

Returns a L<< JIRA::API::IssueTypeScreenSchemeId >> on HTTP code 201.

=cut

=head2 C<< getIssueTypeScreenSchemeMappings >>

  my $res = $client->getIssueTypeScreenSchemeMappings()->get;

Get issue type screen scheme items

Returns a L<< JIRA::API::PageBeanIssueTypeScreenSchemeItem >> on success.

=cut

=head2 C<< getIssueTypeScreenSchemeProjectAssociations >>

  my $res = $client->getIssueTypeScreenSchemeProjectAssociations()->get;

Get issue type screen schemes for projects

Returns a L<< JIRA::API::PageBeanIssueTypeScreenSchemesProjects >> on success.

=cut

=head2 C<< assignIssueTypeScreenSchemeToProject >>

  my $res = $client->assignIssueTypeScreenSchemeToProject()->get;

Assign issue type screen scheme to project

Returns Hashref on HTTP code 204.

=cut

=head2 C<< deleteIssueTypeScreenScheme >>

  my $res = $client->deleteIssueTypeScreenScheme()->get;

Delete issue type screen scheme

Returns Hashref on HTTP code 204.

=cut

=head2 C<< updateIssueTypeScreenScheme >>

  my $res = $client->updateIssueTypeScreenScheme()->get;

Update issue type screen scheme

Returns Hashref on HTTP code 204.

=cut

=head2 C<< appendMappingsForIssueTypeScreenScheme >>

  my $res = $client->appendMappingsForIssueTypeScreenScheme()->get;

Append mappings to issue type screen scheme

Returns Hashref on HTTP code 204.

=cut

=head2 C<< updateDefaultScreenScheme >>

  my $res = $client->updateDefaultScreenScheme()->get;

Update issue type screen scheme default screen scheme

Returns Hashref on HTTP code 204.

=cut

=head2 C<< removeMappingsFromIssueTypeScreenScheme >>

  my $res = $client->removeMappingsFromIssueTypeScreenScheme()->get;

Remove mappings from issue type screen scheme

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getProjectsForIssueTypeScreenScheme >>

  my $res = $client->getProjectsForIssueTypeScreenScheme()->get;

Get issue type screen scheme projects

Returns a L<< JIRA::API::PageBeanProjectDetails >> on success.

=cut

=head2 C<< getAutoComplete >>

  my $res = $client->getAutoComplete()->get;

Get field reference data (GET)

Returns a L<< JIRA::API::JQLReferenceData >> on success.

=cut

=head2 C<< getAutoCompletePost >>

  my $res = $client->getAutoCompletePost()->get;

Get field reference data (POST)

Returns a L<< JIRA::API::JQLReferenceData >> on success.

=cut

=head2 C<< getFieldAutoCompleteForQueryString >>

  my $res = $client->getFieldAutoCompleteForQueryString()->get;

Get field auto complete suggestions

Returns a L<< JIRA::API::AutoCompleteSuggestions >> on success.

=cut

=head2 C<< getPrecomputations >>

  my $res = $client->getPrecomputations()->get;

Get precomputation

Returns a L<< JIRA::API::PageBeanJqlFunctionPrecomputationBean >> on success.

=cut

=head2 C<< updatePrecomputations >>

  my $res = $client->updatePrecomputations()->get;

Update precomputations

Returns Hashref on success.

=cut

=head2 C<< matchIssues >>

  my $res = $client->matchIssues()->get;

Check issues against JQL

Returns a L<< JIRA::API::IssueMatches >> on success.

=cut

=head2 C<< parseJqlQueries >>

  my $res = $client->parseJqlQueries()->get;

Parse JQL query

Returns a L<< JIRA::API::ParsedJqlQueries >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.

=cut

=head2 C<< migrateQueries >>

  my $res = $client->migrateQueries()->get;

Convert user identifiers to account IDs in JQL queries

Returns a L<< JIRA::API::ConvertedJQLQueries >> on success.

=cut

=head2 C<< sanitiseJqlQueries >>

  my $res = $client->sanitiseJqlQueries()->get;

Sanitize JQL queries

Returns a L<< JIRA::API::SanitizedJqlQueries >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.

=cut

=head2 C<< getAllLabels >>

  my $res = $client->getAllLabels()->get;

Get all labels

Returns a L<< JIRA::API::PageBeanString >> on success.

=cut

=head2 C<< getApproximateLicenseCount >>

  my $res = $client->getApproximateLicenseCount()->get;

Get approximate license count

Returns a L<< JIRA::API::LicenseMetric >> on success.

=cut

=head2 C<< getApproximateApplicationLicenseCount >>

  my $res = $client->getApproximateApplicationLicenseCount()->get;

Get approximate application license count

Returns a L<< JIRA::API::LicenseMetric >> on success.

=cut

=head2 C<< getMyPermissions >>

  my $res = $client->getMyPermissions()->get;

Get my permissions

Returns a L<< JIRA::API::Permissions >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< removePreference >>

  my $res = $client->removePreference()->get;

Delete preference


=cut

=head2 C<< getPreference >>

  my $res = $client->getPreference()->get;

Get preference

Returns a L<< string >> on success.

=cut

=head2 C<< setPreference >>

  my $res = $client->setPreference()->get;

Set preference

Returns Hashref on HTTP code 204.

=cut

=head2 C<< deleteLocale >>

  my $res = $client->deleteLocale()->get;

Delete locale

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getLocale >>

  my $res = $client->getLocale()->get;

Get locale

Returns a L<< JIRA::API::Locale >> on success.

=cut

=head2 C<< setLocale >>

  my $res = $client->setLocale()->get;

Set locale

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getCurrentUser >>

  my $res = $client->getCurrentUser()->get;

Get current user

Returns a L<< JIRA::API::User >> on success.

=cut

=head2 C<< getNotificationSchemes >>

  my $res = $client->getNotificationSchemes()->get;

Get notification schemes paginated

Returns a L<< JIRA::API::PageBeanNotificationScheme >> on success.

=cut

=head2 C<< createNotificationScheme >>

  my $res = $client->createNotificationScheme()->get;

Create notification scheme

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::NotificationSchemeId >> on HTTP code 201.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.

=cut

=head2 C<< getNotificationSchemeToProjectMappings >>

  my $res = $client->getNotificationSchemeToProjectMappings()->get;

Get projects using notification schemes paginated

Returns a L<< JIRA::API::PageBeanNotificationSchemeAndProjectMappingJsonBean >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.

=cut

=head2 C<< getNotificationScheme >>

  my $res = $client->getNotificationScheme()->get;

Get notification scheme

Returns a L<< JIRA::API::NotificationScheme >> on success.

=cut

=head2 C<< updateNotificationScheme >>

  my $res = $client->updateNotificationScheme()->get;

Update notification scheme

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns Hashref on HTTP code 204.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< addNotifications >>

  my $res = $client->addNotifications()->get;

Add notifications to notification scheme

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns Hashref on HTTP code 204.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< deleteNotificationScheme >>

  my $res = $client->deleteNotificationScheme()->get;

Delete notification scheme

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns Hashref on HTTP code 204.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< removeNotificationFromNotificationScheme >>

  my $res = $client->removeNotificationFromNotificationScheme()->get;

Remove notification from notification scheme

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns Hashref on HTTP code 204.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< getAllPermissions >>

  my $res = $client->getAllPermissions()->get;

Get all permissions

Returns a L<< JIRA::API::Permissions >> on success.

=cut

=head2 C<< getBulkPermissions >>

  my $res = $client->getBulkPermissions()->get;

Get bulk permissions

Returns a L<< JIRA::API::BulkPermissionGrants >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.

=cut

=head2 C<< getPermittedProjects >>

  my $res = $client->getPermittedProjects()->get;

Get permitted projects

Returns a L<< JIRA::API::PermittedProjects >> on success.

=cut

=head2 C<< getAllPermissionSchemes >>

  my $res = $client->getAllPermissionSchemes()->get;

Get all permission schemes

Returns a L<< JIRA::API::PermissionSchemes >> on success.

=cut

=head2 C<< createPermissionScheme >>

  my $res = $client->createPermissionScheme()->get;

Create permission scheme

Returns a L<< JIRA::API::PermissionScheme >> on HTTP code 201.

=cut

=head2 C<< deletePermissionScheme >>

  my $res = $client->deletePermissionScheme()->get;

Delete permission scheme


=cut

=head2 C<< getPermissionScheme >>

  my $res = $client->getPermissionScheme()->get;

Get permission scheme

Returns a L<< JIRA::API::PermissionScheme >> on success.

=cut

=head2 C<< updatePermissionScheme >>

  my $res = $client->updatePermissionScheme()->get;

Update permission scheme

Returns a L<< JIRA::API::PermissionScheme >> on success.

=cut

=head2 C<< getPermissionSchemeGrants >>

  my $res = $client->getPermissionSchemeGrants()->get;

Get permission scheme grants

Returns a L<< JIRA::API::PermissionGrants >> on success.

=cut

=head2 C<< createPermissionGrant >>

  my $res = $client->createPermissionGrant()->get;

Create permission grant

Returns a L<< JIRA::API::PermissionGrant >> on HTTP code 201.

=cut

=head2 C<< deletePermissionSchemeEntity >>

  my $res = $client->deletePermissionSchemeEntity()->get;

Delete permission scheme grant


=cut

=head2 C<< getPermissionSchemeGrant >>

  my $res = $client->getPermissionSchemeGrant()->get;

Get permission scheme grant

Returns a L<< JIRA::API::PermissionGrant >> on success.

=cut

=head2 C<< getPriorities >>

  my $res = $client->getPriorities()->get;

Get priorities

Returns an array of L<< JIRA::API::Priority >> on success.

=cut

=head2 C<< createPriority >>

  my $res = $client->createPriority()->get;

Create priority

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::PriorityId >> on HTTP code 201.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.

=cut

=head2 C<< setDefaultPriority >>

  my $res = $client->setDefaultPriority()->get;

Set default priority

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns Hashref on HTTP code 204.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< movePriorities >>

  my $res = $client->movePriorities()->get;

Move priorities

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns Hashref on HTTP code 204.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< searchPriorities >>

  my $res = $client->searchPriorities()->get;

Search priorities

Returns a L<< JIRA::API::PageBeanPriority >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.

=cut

=head2 C<< deletePriority >>

  my $res = $client->deletePriority()->get;

Delete priority

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::TaskProgressBeanObject >> on HTTP code 303.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 409.

=cut

=head2 C<< getPriority >>

  my $res = $client->getPriority()->get;

Get priority

Returns a L<< JIRA::API::Priority >> on success.

=cut

=head2 C<< updatePriority >>

  my $res = $client->updatePriority()->get;

Update priority

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns Hashref on HTTP code 204.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< getAllProjects >>

  my $res = $client->getAllProjects()->get;

Get all projects

Returns an array of L<< JIRA::API::Project >> on success.

=cut

=head2 C<< createProject >>

  my $res = $client->createProject()->get;

Create project

Returns a L<< JIRA::API::ProjectIdentifiers >> on HTTP code 201.

=cut

=head2 C<< getRecent >>

  my $res = $client->getRecent()->get;

Get recent projects

Returns an array of L<< JIRA::API::Project >> on success.

=cut

=head2 C<< searchProjects >>

  my $res = $client->searchProjects()->get;

Get projects paginated

Returns a L<< JIRA::API::PageBeanProject >> on success.

=cut

=head2 C<< getAllProjectTypes >>

  my $res = $client->getAllProjectTypes()->get;

Get all project types

Returns an array of L<< JIRA::API::ProjectType >> on success.

=cut

=head2 C<< getAllAccessibleProjectTypes >>

  my $res = $client->getAllAccessibleProjectTypes()->get;

Get licensed project types

Returns an array of L<< JIRA::API::ProjectType >> on success.

=cut

=head2 C<< getProjectTypeByKey >>

  my $res = $client->getProjectTypeByKey()->get;

Get project type by key

Returns a L<< JIRA::API::ProjectType >> on success.

=cut

=head2 C<< getAccessibleProjectTypeByKey >>

  my $res = $client->getAccessibleProjectTypeByKey()->get;

Get accessible project type by key

Returns a L<< JIRA::API::ProjectType >> on success.

=cut

=head2 C<< deleteProject >>

  my $res = $client->deleteProject()->get;

Delete project


=cut

=head2 C<< getProject >>

  my $res = $client->getProject()->get;

Get project

Returns a L<< JIRA::API::Project >> on success.

=cut

=head2 C<< updateProject >>

  my $res = $client->updateProject()->get;

Update project

Returns a L<< JIRA::API::Project >> on success.

=cut

=head2 C<< archiveProject >>

  my $res = $client->archiveProject()->get;

Archive project

Returns Hashref on HTTP code 204.

=cut

=head2 C<< updateProjectAvatar >>

  my $res = $client->updateProjectAvatar()->get;

Set project avatar

Returns Hashref on HTTP code 204.

=cut

=head2 C<< deleteProjectAvatar >>

  my $res = $client->deleteProjectAvatar()->get;

Delete project avatar


=cut

=head2 C<< createProjectAvatar >>

  my $res = $client->createProjectAvatar()->get;

Load project avatar

Returns a L<< JIRA::API::Avatar >> on HTTP code 201.

=cut

=head2 C<< getAllProjectAvatars >>

  my $res = $client->getAllProjectAvatars()->get;

Get all project avatars

Returns a L<< JIRA::API::ProjectAvatars >> on success.

=cut

=head2 C<< getProjectComponentsPaginated >>

  my $res = $client->getProjectComponentsPaginated()->get;

Get project components paginated

Returns a L<< JIRA::API::PageBeanComponentWithIssueCount >> on success.

=cut

=head2 C<< getProjectComponents >>

  my $res = $client->getProjectComponents()->get;

Get project components

Returns an array of L<< JIRA::API::ProjectComponent >> on success.

=cut

=head2 C<< deleteProjectAsynchronously >>

  my $res = $client->deleteProjectAsynchronously()->get;

Delete project asynchronously

Returns a L<< JIRA::API::TaskProgressBeanObject >> on HTTP code 303.

=cut

=head2 C<< getFeaturesForProject >>

  my $res = $client->getFeaturesForProject()->get;

Get project features

Returns a L<< JIRA::API::ContainerForProjectFeatures >> on success.

=cut

=head2 C<< toggleFeatureForProject >>

  my $res = $client->toggleFeatureForProject()->get;

Set project feature state

Returns a L<< JIRA::API::ContainerForProjectFeatures >> on success.

=cut

=head2 C<< getProjectPropertyKeys >>

  my $res = $client->getProjectPropertyKeys()->get;

Get project property keys

Returns a L<< JIRA::API::PropertyKeys >> on success.

=cut

=head2 C<< deleteProjectProperty >>

  my $res = $client->deleteProjectProperty()->get;

Delete project property


=cut

=head2 C<< getProjectProperty >>

  my $res = $client->getProjectProperty()->get;

Get project property

Returns a L<< JIRA::API::EntityProperty >> on success.

=cut

=head2 C<< setProjectProperty >>

  my $res = $client->setProjectProperty()->get;

Set project property

Returns Hashref on success.
Returns Hashref on HTTP code 201.

=cut

=head2 C<< restore >>

  my $res = $client->restore()->get;

Restore deleted or archived project

Returns a L<< JIRA::API::Project >> on success.

=cut

=head2 C<< getProjectRoles >>

  my $res = $client->getProjectRoles()->get;

Get project roles for project

Returns Hashref on success.

=cut

=head2 C<< deleteActor >>

  my $res = $client->deleteActor()->get;

Delete actors from project role


=cut

=head2 C<< getProjectRole >>

  my $res = $client->getProjectRole()->get;

Get project role for project

Returns a L<< JIRA::API::ProjectRole >> on success.

=cut

=head2 C<< addActorUsers >>

  my $res = $client->addActorUsers()->get;

Add actors to project role

Returns a L<< JIRA::API::ProjectRole >> on success.

=cut

=head2 C<< setActors >>

  my $res = $client->setActors()->get;

Set actors for project role

Returns a L<< JIRA::API::ProjectRole >> on success.

=cut

=head2 C<< getProjectRoleDetails >>

  my $res = $client->getProjectRoleDetails()->get;

Get project role details

Returns an array of L<< JIRA::API::ProjectRoleDetails >> on success.

=cut

=head2 C<< getAllStatuses >>

  my $res = $client->getAllStatuses()->get;

Get all statuses for project

Returns an array of L<< JIRA::API::IssueTypeWithStatus >> on success.

=cut

=head2 C<< updateProjectType >>

  my $res = $client->updateProjectType()->get;

Update project type

Returns a L<< JIRA::API::Project >> on success.

=cut

=head2 C<< getProjectVersionsPaginated >>

  my $res = $client->getProjectVersionsPaginated()->get;

Get project versions paginated

Returns a L<< JIRA::API::PageBeanVersion >> on success.

=cut

=head2 C<< getProjectVersions >>

  my $res = $client->getProjectVersions()->get;

Get project versions

Returns an array of L<< JIRA::API::Version >> on success.

=cut

=head2 C<< getProjectEmail >>

  my $res = $client->getProjectEmail()->get;

Get project's sender email

Returns a L<< JIRA::API::ProjectEmailAddress >> on success.

=cut

=head2 C<< updateProjectEmail >>

  my $res = $client->updateProjectEmail()->get;

Set project's sender email

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getHierarchy >>

  my $res = $client->getHierarchy()->get;

Get project issue type hierarchy

Returns a L<< JIRA::API::ProjectIssueTypeHierarchy >> on success.

=cut

=head2 C<< getProjectIssueSecurityScheme >>

  my $res = $client->getProjectIssueSecurityScheme()->get;

Get project issue security scheme

Returns a L<< JIRA::API::SecurityScheme >> on success.

=cut

=head2 C<< getNotificationSchemeForProject >>

  my $res = $client->getNotificationSchemeForProject()->get;

Get project notification scheme

Returns a L<< JIRA::API::NotificationScheme >> on success.

=cut

=head2 C<< getAssignedPermissionScheme >>

  my $res = $client->getAssignedPermissionScheme()->get;

Get assigned permission scheme

Returns a L<< JIRA::API::PermissionScheme >> on success.

=cut

=head2 C<< assignPermissionScheme >>

  my $res = $client->assignPermissionScheme()->get;

Assign permission scheme

Returns a L<< JIRA::API::PermissionScheme >> on success.

=cut

=head2 C<< getSecurityLevelsForProject >>

  my $res = $client->getSecurityLevelsForProject()->get;

Get project issue security levels

Returns a L<< JIRA::API::ProjectIssueSecurityLevels >> on success.

=cut

=head2 C<< getAllProjectCategories >>

  my $res = $client->getAllProjectCategories()->get;

Get all project categories

Returns an array of L<< JIRA::API::ProjectCategory >> on success.

=cut

=head2 C<< createProjectCategory >>

  my $res = $client->createProjectCategory()->get;

Create project category

Returns a L<< JIRA::API::ProjectCategory >> on HTTP code 201.

=cut

=head2 C<< removeProjectCategory >>

  my $res = $client->removeProjectCategory()->get;

Delete project category


=cut

=head2 C<< getProjectCategoryById >>

  my $res = $client->getProjectCategoryById()->get;

Get project category by ID

Returns a L<< JIRA::API::ProjectCategory >> on success.

=cut

=head2 C<< updateProjectCategory >>

  my $res = $client->updateProjectCategory()->get;

Update project category

Returns a L<< JIRA::API::UpdatedProjectCategory >> on success.

=cut

=head2 C<< validateProjectKey >>

  my $res = $client->validateProjectKey()->get;

Validate project key

Returns a L<< JIRA::API::ErrorCollection >> on success.

=cut

=head2 C<< getValidProjectKey >>

  my $res = $client->getValidProjectKey()->get;

Get valid project key

Returns a L<< string >> on success.

=cut

=head2 C<< getValidProjectName >>

  my $res = $client->getValidProjectName()->get;

Get valid project name

Returns a L<< string >> on success.

=cut

=head2 C<< getResolutions >>

  my $res = $client->getResolutions()->get;

Get resolutions

Returns an array of L<< JIRA::API::Resolution >> on success.

=cut

=head2 C<< createResolution >>

  my $res = $client->createResolution()->get;

Create resolution

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ResolutionId >> on HTTP code 201.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.

=cut

=head2 C<< setDefaultResolution >>

  my $res = $client->setDefaultResolution()->get;

Set default resolution

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns Hashref on HTTP code 204.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< moveResolutions >>

  my $res = $client->moveResolutions()->get;

Move resolutions

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns Hashref on HTTP code 204.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< searchResolutions >>

  my $res = $client->searchResolutions()->get;

Search resolutions

Returns a L<< JIRA::API::PageBeanResolutionJsonBean >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.

=cut

=head2 C<< deleteResolution >>

  my $res = $client->deleteResolution()->get;

Delete resolution

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::TaskProgressBeanObject >> on HTTP code 303.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 409.

=cut

=head2 C<< getResolution >>

  my $res = $client->getResolution()->get;

Get resolution

Returns a L<< JIRA::API::Resolution >> on success.

=cut

=head2 C<< updateResolution >>

  my $res = $client->updateResolution()->get;

Update resolution

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns Hashref on HTTP code 204.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< getAllProjectRoles >>

  my $res = $client->getAllProjectRoles()->get;

Get all project roles

Returns an array of L<< JIRA::API::ProjectRole >> on success.

=cut

=head2 C<< createProjectRole >>

  my $res = $client->createProjectRole()->get;

Create project role

Returns a L<< JIRA::API::ProjectRole >> on success.

=cut

=head2 C<< deleteProjectRole >>

  my $res = $client->deleteProjectRole()->get;

Delete project role


=cut

=head2 C<< getProjectRoleById >>

  my $res = $client->getProjectRoleById()->get;

Get project role by ID

Returns a L<< JIRA::API::ProjectRole >> on success.

=cut

=head2 C<< partialUpdateProjectRole >>

  my $res = $client->partialUpdateProjectRole()->get;

Partial update project role

Returns a L<< JIRA::API::ProjectRole >> on success.

=cut

=head2 C<< fullyUpdateProjectRole >>

  my $res = $client->fullyUpdateProjectRole()->get;

Fully update project role

Returns a L<< JIRA::API::ProjectRole >> on success.

=cut

=head2 C<< deleteProjectRoleActorsFromRole >>

  my $res = $client->deleteProjectRoleActorsFromRole()->get;

Delete default actors from project role

Returns a L<< JIRA::API::ProjectRole >> on success.

=cut

=head2 C<< getProjectRoleActorsForRole >>

  my $res = $client->getProjectRoleActorsForRole()->get;

Get default actors for project role

Returns a L<< JIRA::API::ProjectRole >> on success.

=cut

=head2 C<< addProjectRoleActorsToRole >>

  my $res = $client->addProjectRoleActorsToRole()->get;

Add default actors to project role

Returns a L<< JIRA::API::ProjectRole >> on success.

=cut

=head2 C<< getScreens >>

  my $res = $client->getScreens()->get;

Get screens

Returns a L<< JIRA::API::PageBeanScreen >> on success.

=cut

=head2 C<< createScreen >>

  my $res = $client->createScreen()->get;

Create screen

Returns a L<< JIRA::API::Screen >> on HTTP code 201.

=cut

=head2 C<< addFieldToDefaultScreen >>

  my $res = $client->addFieldToDefaultScreen()->get;

Add field to default screen

Returns Hashref on success.

=cut

=head2 C<< deleteScreen >>

  my $res = $client->deleteScreen()->get;

Delete screen


=cut

=head2 C<< updateScreen >>

  my $res = $client->updateScreen()->get;

Update screen

Returns a L<< JIRA::API::Screen >> on success.

=cut

=head2 C<< getAvailableScreenFields >>

  my $res = $client->getAvailableScreenFields()->get;

Get available screen fields

Returns an array of L<< JIRA::API::ScreenableField >> on success.

=cut

=head2 C<< getAllScreenTabs >>

  my $res = $client->getAllScreenTabs()->get;

Get all screen tabs

Returns an array of L<< JIRA::API::ScreenableTab >> on success.

=cut

=head2 C<< addScreenTab >>

  my $res = $client->addScreenTab()->get;

Create screen tab

Returns a L<< JIRA::API::ScreenableTab >> on success.

=cut

=head2 C<< deleteScreenTab >>

  my $res = $client->deleteScreenTab()->get;

Delete screen tab


=cut

=head2 C<< renameScreenTab >>

  my $res = $client->renameScreenTab()->get;

Update screen tab

Returns a L<< JIRA::API::ScreenableTab >> on success.

=cut

=head2 C<< getAllScreenTabFields >>

  my $res = $client->getAllScreenTabFields()->get;

Get all screen tab fields

Returns an array of L<< JIRA::API::ScreenableField >> on success.

=cut

=head2 C<< addScreenTabField >>

  my $res = $client->addScreenTabField()->get;

Add screen tab field

Returns a L<< JIRA::API::ScreenableField >> on success.

=cut

=head2 C<< removeScreenTabField >>

  my $res = $client->removeScreenTabField()->get;

Remove screen tab field


=cut

=head2 C<< moveScreenTabField >>

  my $res = $client->moveScreenTabField()->get;

Move screen tab field

Returns Hashref on HTTP code 204.

=cut

=head2 C<< moveScreenTab >>

  my $res = $client->moveScreenTab()->get;

Move screen tab

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getScreenSchemes >>

  my $res = $client->getScreenSchemes()->get;

Get screen schemes

Returns a L<< JIRA::API::PageBeanScreenScheme >> on success.

=cut

=head2 C<< createScreenScheme >>

  my $res = $client->createScreenScheme()->get;

Create screen scheme

Returns a L<< JIRA::API::ScreenSchemeId >> on HTTP code 201.

=cut

=head2 C<< deleteScreenScheme >>

  my $res = $client->deleteScreenScheme()->get;

Delete screen scheme


=cut

=head2 C<< updateScreenScheme >>

  my $res = $client->updateScreenScheme()->get;

Update screen scheme

Returns Hashref on HTTP code 204.

=cut

=head2 C<< searchForIssuesUsingJql >>

  my $res = $client->searchForIssuesUsingJql()->get;

Search for issues using JQL (GET)

Returns a L<< JIRA::API::SearchResults >> on success.

=cut

=head2 C<< searchForIssuesUsingJqlPost >>

  my $res = $client->searchForIssuesUsingJqlPost()->get;

Search for issues using JQL (POST)

Returns a L<< JIRA::API::SearchResults >> on success.

=cut

=head2 C<< getIssueSecurityLevel >>

  my $res = $client->getIssueSecurityLevel()->get;

Get issue security level

Returns a L<< JIRA::API::SecurityLevel >> on success.

=cut

=head2 C<< getServerInfo >>

  my $res = $client->getServerInfo()->get;

Get Jira instance info

Returns a L<< JIRA::API::ServerInformation >> on success.

=cut

=head2 C<< getIssueNavigatorDefaultColumns >>

  my $res = $client->getIssueNavigatorDefaultColumns()->get;

Get issue navigator default columns

Returns an array of L<< JIRA::API::ColumnItem >> on success.

=cut

=head2 C<< setIssueNavigatorDefaultColumns >>

  my $res = $client->setIssueNavigatorDefaultColumns()->get;

Set issue navigator default columns

Returns Hashref on success.

=cut

=head2 C<< getStatuses >>

  my $res = $client->getStatuses()->get;

Get all statuses

Returns an array of L<< JIRA::API::StatusDetails >> on success.

=cut

=head2 C<< getStatus >>

  my $res = $client->getStatus()->get;

Get status

Returns a L<< JIRA::API::StatusDetails >> on success.

=cut

=head2 C<< getStatusCategories >>

  my $res = $client->getStatusCategories()->get;

Get all status categories

Returns an array of L<< JIRA::API::StatusCategory >> on success.

=cut

=head2 C<< getStatusCategory >>

  my $res = $client->getStatusCategory()->get;

Get status category

Returns a L<< JIRA::API::StatusCategory >> on success.

=cut

=head2 C<< deleteStatusesById >>

  my $res = $client->deleteStatusesById()->get;

Bulk delete Statuses

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getStatusesById >>

  my $res = $client->getStatusesById()->get;

Bulk get statuses

Returns an array of L<< JIRA::API::JiraStatus >> on success.

=cut

=head2 C<< createStatuses >>

  my $res = $client->createStatuses()->get;

Bulk create statuses

Returns an array of L<< JIRA::API::JiraStatus >> on success.

=cut

=head2 C<< updateStatuses >>

  my $res = $client->updateStatuses()->get;

Bulk update statuses

Returns Hashref on HTTP code 204.

=cut

=head2 C<< search >>

  my $res = $client->search()->get;

Search statuses paginated

Returns a L<< JIRA::API::PageOfStatuses >> on success.

=cut

=head2 C<< getTask >>

  my $res = $client->getTask()->get;

Get task

Returns a L<< JIRA::API::TaskProgressBeanObject >> on success.

=cut

=head2 C<< cancelTask >>

  my $res = $client->cancelTask()->get;

Cancel task

Returns an array of L<< JIRA::API:: >> on error.
Returns Hashref on HTTP code 202.
Returns an array of L<< JIRA::API:: >> on HTTP code 401.
Returns an array of L<< JIRA::API:: >> on HTTP code 403.
Returns an array of L<< JIRA::API:: >> on HTTP code 404.

=cut

=head2 C<< getUiModifications >>

  my $res = $client->getUiModifications()->get;

Get UI modifications

Returns a L<< JIRA::API::PageBeanUiModificationDetails >> on success.

=cut

=head2 C<< createUiModification >>

  my $res = $client->createUiModification()->get;

Create UI modification

Returns a L<< JIRA::API::UiModificationIdentifiers >> on HTTP code 201.

=cut

=head2 C<< deleteUiModification >>

  my $res = $client->deleteUiModification()->get;

Delete UI modification

Returns Hashref on HTTP code 204.

=cut

=head2 C<< updateUiModification >>

  my $res = $client->updateUiModification()->get;

Update UI modification

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getAvatars >>

  my $res = $client->getAvatars()->get;

Get avatars

Returns a L<< JIRA::API::Avatars >> on success.

=cut

=head2 C<< storeAvatar >>

  my $res = $client->storeAvatar()->get;

Load avatar

Returns a L<< JIRA::API::Avatar >> on HTTP code 201.

=cut

=head2 C<< deleteAvatar >>

  my $res = $client->deleteAvatar()->get;

Delete avatar


=cut

=head2 C<< getAvatarImageByType >>

  my $res = $client->getAvatarImageByType()->get;

Get avatar image by type

Returns Hashref on success.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< getAvatarImageByID >>

  my $res = $client->getAvatarImageByID()->get;

Get avatar image by ID

Returns Hashref on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< getAvatarImageByOwner >>

  my $res = $client->getAvatarImageByOwner()->get;

Get avatar image by owner

Returns Hashref on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 401.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 404.

=cut

=head2 C<< removeUser >>

  my $res = $client->removeUser()->get;

Delete user


=cut

=head2 C<< getUser >>

  my $res = $client->getUser()->get;

Get user

Returns a L<< JIRA::API::User >> on success.

=cut

=head2 C<< createUser >>

  my $res = $client->createUser()->get;

Create user

Returns a L<< JIRA::API::User >> on HTTP code 201.

=cut

=head2 C<< findBulkAssignableUsers >>

  my $res = $client->findBulkAssignableUsers()->get;

Find users assignable to projects

Returns an array of L<< JIRA::API::User >> on success.

=cut

=head2 C<< findAssignableUsers >>

  my $res = $client->findAssignableUsers()->get;

Find users assignable to issues

Returns an array of L<< JIRA::API::User >> on success.

=cut

=head2 C<< bulkGetUsers >>

  my $res = $client->bulkGetUsers()->get;

Bulk get users

Returns a L<< JIRA::API::PageBeanUser >> on success.

=cut

=head2 C<< bulkGetUsersMigration >>

  my $res = $client->bulkGetUsersMigration()->get;

Get account IDs for users

Returns an array of L<< JIRA::API::UserMigrationBean >> on success.

=cut

=head2 C<< resetUserColumns >>

  my $res = $client->resetUserColumns()->get;

Reset user default columns


=cut

=head2 C<< getUserDefaultColumns >>

  my $res = $client->getUserDefaultColumns()->get;

Get user default columns

Returns an array of L<< JIRA::API::ColumnItem >> on success.

=cut

=head2 C<< setUserColumns >>

  my $res = $client->setUserColumns()->get;

Set user default columns

Returns Hashref on success.

=cut

=head2 C<< getUserEmail >>

  my $res = $client->getUserEmail()->get;

Get user email

Returns a L<< JIRA::API::UnrestrictedUserEmail >> on success.

=cut

=head2 C<< getUserEmailBulk >>

  my $res = $client->getUserEmailBulk()->get;

Get user email bulk

Returns a L<< JIRA::API::UnrestrictedUserEmail >> on success.

=cut

=head2 C<< getUserGroups >>

  my $res = $client->getUserGroups()->get;

Get user groups

Returns an array of L<< JIRA::API::GroupName >> on success.

=cut

=head2 C<< findUsersWithAllPermissions >>

  my $res = $client->findUsersWithAllPermissions()->get;

Find users with permissions

Returns an array of L<< JIRA::API::User >> on success.

=cut

=head2 C<< findUsersForPicker >>

  my $res = $client->findUsersForPicker()->get;

Find users for picker

Returns a L<< JIRA::API::FoundUsers >> on success.

=cut

=head2 C<< getUserPropertyKeys >>

  my $res = $client->getUserPropertyKeys()->get;

Get user property keys

Returns a L<< JIRA::API::PropertyKeys >> on success.

=cut

=head2 C<< deleteUserProperty >>

  my $res = $client->deleteUserProperty()->get;

Delete user property


=cut

=head2 C<< getUserProperty >>

  my $res = $client->getUserProperty()->get;

Get user property

Returns a L<< JIRA::API::EntityProperty >> on success.

=cut

=head2 C<< setUserProperty >>

  my $res = $client->setUserProperty()->get;

Set user property

Returns Hashref on success.
Returns Hashref on HTTP code 201.

=cut

=head2 C<< findUsers >>

  my $res = $client->findUsers()->get;

Find users

Returns an array of L<< JIRA::API::User >> on success.

=cut

=head2 C<< findUsersByQuery >>

  my $res = $client->findUsersByQuery()->get;

Find users by query

Returns a L<< JIRA::API::PageBeanUser >> on success.

=cut

=head2 C<< findUserKeysByQuery >>

  my $res = $client->findUserKeysByQuery()->get;

Find user keys by query

Returns a L<< JIRA::API::PageBeanUserKey >> on success.

=cut

=head2 C<< findUsersWithBrowsePermission >>

  my $res = $client->findUsersWithBrowsePermission()->get;

Find users with browse permission

Returns an array of L<< JIRA::API::User >> on success.

=cut

=head2 C<< getAllUsersDefault >>

  my $res = $client->getAllUsersDefault()->get;

Get all users default

Returns an array of L<< JIRA::API::User >> on success.

=cut

=head2 C<< getAllUsers >>

  my $res = $client->getAllUsers()->get;

Get all users

Returns an array of L<< JIRA::API::User >> on success.

=cut

=head2 C<< createVersion >>

  my $res = $client->createVersion()->get;

Create version

Returns a L<< JIRA::API::Version >> on HTTP code 201.

=cut

=head2 C<< deleteVersion >>

  my $res = $client->deleteVersion()->get;

Delete version


=cut

=head2 C<< getVersion >>

  my $res = $client->getVersion()->get;

Get version

Returns a L<< JIRA::API::Version >> on success.

=cut

=head2 C<< updateVersion >>

  my $res = $client->updateVersion()->get;

Update version

Returns a L<< JIRA::API::Version >> on success.

=cut

=head2 C<< mergeVersions >>

  my $res = $client->mergeVersions()->get;

Merge versions

Returns Hashref on HTTP code 204.

=cut

=head2 C<< moveVersion >>

  my $res = $client->moveVersion()->get;

Move version

Returns a L<< JIRA::API::Version >> on success.

=cut

=head2 C<< getVersionRelatedIssues >>

  my $res = $client->getVersionRelatedIssues()->get;

Get version's related issues count

Returns a L<< JIRA::API::VersionIssueCounts >> on success.

=cut

=head2 C<< deleteAndReplaceVersion >>

  my $res = $client->deleteAndReplaceVersion()->get;

Delete and replace version

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getVersionUnresolvedIssues >>

  my $res = $client->getVersionUnresolvedIssues()->get;

Get version's unresolved issues count

Returns a L<< JIRA::API::VersionUnresolvedIssuesCount >> on success.

=cut

=head2 C<< deleteWebhookById >>

  my $res = $client->deleteWebhookById()->get;

Delete webhooks by ID

Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.

=cut

=head2 C<< getDynamicWebhooksForApp >>

  my $res = $client->getDynamicWebhooksForApp()->get;

Get dynamic webhooks for app

Returns a L<< JIRA::API::PageBeanWebhook >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.

=cut

=head2 C<< registerDynamicWebhooks >>

  my $res = $client->registerDynamicWebhooks()->get;

Register dynamic webhooks

Returns a L<< JIRA::API::ContainerForRegisteredWebhooks >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.

=cut

=head2 C<< getFailedWebhooks >>

  my $res = $client->getFailedWebhooks()->get;

Get failed webhooks

Returns a L<< JIRA::API::FailedWebhooks >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.

=cut

=head2 C<< refreshWebhooks >>

  my $res = $client->refreshWebhooks()->get;

Extend webhook life

Returns a L<< JIRA::API::WebhooksExpirationDate >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.

=cut

=head2 C<< getAllWorkflows >>

  my $res = $client->getAllWorkflows()->get;

Get all workflows

Returns an array of L<< JIRA::API::DeprecatedWorkflow >> on success.

=cut

=head2 C<< createWorkflow >>

  my $res = $client->createWorkflow()->get;

Create workflow

Returns a L<< JIRA::API::WorkflowIDs >> on HTTP code 201.

=cut

=head2 C<< getWorkflowTransitionRuleConfigurations >>

  my $res = $client->getWorkflowTransitionRuleConfigurations()->get;

Get workflow transition rule configurations

Returns a L<< JIRA::API::PageBeanWorkflowTransitionRules >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.

=cut

=head2 C<< updateWorkflowTransitionRuleConfigurations >>

  my $res = $client->updateWorkflowTransitionRuleConfigurations()->get;

Update workflow transition rule configurations

Returns a L<< JIRA::API::WorkflowTransitionRulesUpdateErrors >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.

=cut

=head2 C<< deleteWorkflowTransitionRuleConfigurations >>

  my $res = $client->deleteWorkflowTransitionRuleConfigurations()->get;

Delete workflow transition rule configurations

Returns a L<< JIRA::API::WorkflowTransitionRulesUpdateErrors >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on error.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.

=cut

=head2 C<< getWorkflowsPaginated >>

  my $res = $client->getWorkflowsPaginated()->get;

Get workflows paginated

Returns a L<< JIRA::API::PageBeanWorkflow >> on success.
Returns a L<< JIRA::API::ErrorCollection >> on HTTP code 403.

=cut

=head2 C<< deleteWorkflowTransitionProperty >>

  my $res = $client->deleteWorkflowTransitionProperty()->get;

Delete workflow transition property


=cut

=head2 C<< getWorkflowTransitionProperties >>

  my $res = $client->getWorkflowTransitionProperties()->get;

Get workflow transition properties

Returns a L<< JIRA::API::WorkflowTransitionProperty >> on success.

=cut

=head2 C<< createWorkflowTransitionProperty >>

  my $res = $client->createWorkflowTransitionProperty()->get;

Create workflow transition property

Returns a L<< JIRA::API::WorkflowTransitionProperty >> on success.

=cut

=head2 C<< updateWorkflowTransitionProperty >>

  my $res = $client->updateWorkflowTransitionProperty()->get;

Update workflow transition property

Returns a L<< JIRA::API::WorkflowTransitionProperty >> on success.

=cut

=head2 C<< deleteInactiveWorkflow >>

  my $res = $client->deleteInactiveWorkflow()->get;

Delete inactive workflow


=cut

=head2 C<< getAllWorkflowSchemes >>

  my $res = $client->getAllWorkflowSchemes()->get;

Get all workflow schemes

Returns a L<< JIRA::API::PageBeanWorkflowScheme >> on success.

=cut

=head2 C<< createWorkflowScheme >>

  my $res = $client->createWorkflowScheme()->get;

Create workflow scheme

Returns a L<< JIRA::API::WorkflowScheme >> on HTTP code 201.

=cut

=head2 C<< getWorkflowSchemeProjectAssociations >>

  my $res = $client->getWorkflowSchemeProjectAssociations()->get;

Get workflow scheme project associations

Returns a L<< JIRA::API::ContainerOfWorkflowSchemeAssociations >> on success.

=cut

=head2 C<< assignSchemeToProject >>

  my $res = $client->assignSchemeToProject()->get;

Assign workflow scheme to project

Returns Hashref on HTTP code 204.

=cut

=head2 C<< deleteWorkflowScheme >>

  my $res = $client->deleteWorkflowScheme()->get;

Delete workflow scheme

Returns Hashref on HTTP code 204.

=cut

=head2 C<< getWorkflowScheme >>

  my $res = $client->getWorkflowScheme()->get;

Get workflow scheme

Returns a L<< JIRA::API::WorkflowScheme >> on success.

=cut

=head2 C<< updateWorkflowScheme >>

  my $res = $client->updateWorkflowScheme()->get;

Update workflow scheme

Returns a L<< JIRA::API::WorkflowScheme >> on success.

=cut

=head2 C<< createWorkflowSchemeDraftFromParent >>

  my $res = $client->createWorkflowSchemeDraftFromParent()->get;

Create draft workflow scheme

Returns a L<< JIRA::API::WorkflowScheme >> on HTTP code 201.

=cut

=head2 C<< deleteDefaultWorkflow >>

  my $res = $client->deleteDefaultWorkflow()->get;

Delete default workflow

Returns a L<< JIRA::API::WorkflowScheme >> on success.

=cut

=head2 C<< getDefaultWorkflow >>

  my $res = $client->getDefaultWorkflow()->get;

Get default workflow

Returns a L<< JIRA::API::DefaultWorkflow >> on success.

=cut

=head2 C<< updateDefaultWorkflow >>

  my $res = $client->updateDefaultWorkflow()->get;

Update default workflow

Returns a L<< JIRA::API::WorkflowScheme >> on success.

=cut

=head2 C<< deleteWorkflowSchemeDraft >>

  my $res = $client->deleteWorkflowSchemeDraft()->get;

Delete draft workflow scheme


=cut

=head2 C<< getWorkflowSchemeDraft >>

  my $res = $client->getWorkflowSchemeDraft()->get;

Get draft workflow scheme

Returns a L<< JIRA::API::WorkflowScheme >> on success.

=cut

=head2 C<< updateWorkflowSchemeDraft >>

  my $res = $client->updateWorkflowSchemeDraft()->get;

Update draft workflow scheme

Returns a L<< JIRA::API::WorkflowScheme >> on success.

=cut

=head2 C<< deleteDraftDefaultWorkflow >>

  my $res = $client->deleteDraftDefaultWorkflow()->get;

Delete draft default workflow

Returns a L<< JIRA::API::WorkflowScheme >> on success.

=cut

=head2 C<< getDraftDefaultWorkflow >>

  my $res = $client->getDraftDefaultWorkflow()->get;

Get draft default workflow

Returns a L<< JIRA::API::DefaultWorkflow >> on success.

=cut

=head2 C<< updateDraftDefaultWorkflow >>

  my $res = $client->updateDraftDefaultWorkflow()->get;

Update draft default workflow

Returns a L<< JIRA::API::WorkflowScheme >> on success.

=cut

=head2 C<< deleteWorkflowSchemeDraftIssueType >>

  my $res = $client->deleteWorkflowSchemeDraftIssueType()->get;

Delete workflow for issue type in draft workflow scheme

Returns a L<< JIRA::API::WorkflowScheme >> on success.

=cut

=head2 C<< getWorkflowSchemeDraftIssueType >>

  my $res = $client->getWorkflowSchemeDraftIssueType()->get;

Get workflow for issue type in draft workflow scheme

Returns a L<< JIRA::API::IssueTypeWorkflowMapping >> on success.

=cut

=head2 C<< setWorkflowSchemeDraftIssueType >>

  my $res = $client->setWorkflowSchemeDraftIssueType()->get;

Set workflow for issue type in draft workflow scheme

Returns a L<< JIRA::API::WorkflowScheme >> on success.

=cut

=head2 C<< publishDraftWorkflowScheme >>

  my $res = $client->publishDraftWorkflowScheme()->get;

Publish draft workflow scheme

Returns a L<< JIRA::API::TaskProgressBeanObject >> on HTTP code 303.

=cut

=head2 C<< deleteDraftWorkflowMapping >>

  my $res = $client->deleteDraftWorkflowMapping()->get;

Delete issue types for workflow in draft workflow scheme


=cut

=head2 C<< getDraftWorkflow >>

  my $res = $client->getDraftWorkflow()->get;

Get issue types for workflows in draft workflow scheme

Returns a L<< JIRA::API::IssueTypesWorkflowMapping >> on success.

=cut

=head2 C<< updateDraftWorkflowMapping >>

  my $res = $client->updateDraftWorkflowMapping()->get;

Set issue types for workflow in workflow scheme

Returns a L<< JIRA::API::WorkflowScheme >> on success.

=cut

=head2 C<< deleteWorkflowSchemeIssueType >>

  my $res = $client->deleteWorkflowSchemeIssueType()->get;

Delete workflow for issue type in workflow scheme

Returns a L<< JIRA::API::WorkflowScheme >> on success.

=cut

=head2 C<< getWorkflowSchemeIssueType >>

  my $res = $client->getWorkflowSchemeIssueType()->get;

Get workflow for issue type in workflow scheme

Returns a L<< JIRA::API::IssueTypeWorkflowMapping >> on success.

=cut

=head2 C<< setWorkflowSchemeIssueType >>

  my $res = $client->setWorkflowSchemeIssueType()->get;

Set workflow for issue type in workflow scheme

Returns a L<< JIRA::API::WorkflowScheme >> on success.

=cut

=head2 C<< deleteWorkflowMapping >>

  my $res = $client->deleteWorkflowMapping()->get;

Delete issue types for workflow in workflow scheme


=cut

=head2 C<< getWorkflow >>

  my $res = $client->getWorkflow()->get;

Get issue types for workflows in workflow scheme

Returns a L<< JIRA::API::IssueTypesWorkflowMapping >> on success.

=cut

=head2 C<< updateWorkflowMapping >>

  my $res = $client->updateWorkflowMapping()->get;

Set issue types for workflow in workflow scheme

Returns a L<< JIRA::API::WorkflowScheme >> on success.

=cut

=head2 C<< getIdsOfWorklogsDeletedSince >>

  my $res = $client->getIdsOfWorklogsDeletedSince()->get;

Get IDs of deleted worklogs

Returns a L<< JIRA::API::ChangedWorklogs >> on success.

=cut

=head2 C<< getWorklogsForIds >>

  my $res = $client->getWorklogsForIds()->get;

Get worklogs

Returns an array of L<< JIRA::API::Worklog >> on success.

=cut

=head2 C<< getIdsOfWorklogsModifiedSince >>

  my $res = $client->getIdsOfWorklogsModifiedSince()->get;

Get IDs of updated worklogs

Returns a L<< JIRA::API::ChangedWorklogs >> on success.

=cut

=head2 C<< AddonPropertiesResource_getAddonProperties_get >>

  my $res = $client->AddonPropertiesResource_getAddonProperties_get()->get;

Get app properties

Returns a L<< JIRA::API::PropertyKeys >> on success.
Returns a L<< JIRA::API::OperationMessage >> on HTTP code 401.

=cut

=head2 C<< AddonPropertiesResource_deleteAddonProperty_delete >>

  my $res = $client->AddonPropertiesResource_deleteAddonProperty_delete()->get;

Delete app property

Returns a L<< JIRA::API::OperationMessage >> on error.
Returns a L<< JIRA::API::OperationMessage >> on HTTP code 401.
Returns a L<< JIRA::API::OperationMessage >> on HTTP code 404.

=cut

=head2 C<< AddonPropertiesResource_getAddonProperty_get >>

  my $res = $client->AddonPropertiesResource_getAddonProperty_get()->get;

Get app property

Returns a L<< JIRA::API::EntityProperty >> on success.
Returns a L<< JIRA::API::OperationMessage >> on error.
Returns a L<< JIRA::API::OperationMessage >> on HTTP code 401.
Returns a L<< JIRA::API::OperationMessage >> on HTTP code 404.

=cut

=head2 C<< AddonPropertiesResource_putAddonProperty_put >>

  my $res = $client->AddonPropertiesResource_putAddonProperty_put()->get;

Set app property

Returns a L<< JIRA::API::OperationMessage >> on success.
Returns a L<< JIRA::API::OperationMessage >> on error.
Returns a L<< JIRA::API::OperationMessage >> on HTTP code 201.
Returns a L<< JIRA::API::OperationMessage >> on HTTP code 401.

=cut

=head2 C<< DynamicModulesResource_removeModules_delete >>

  my $res = $client->DynamicModulesResource_removeModules_delete()->get;

Remove modules

Returns a L<< JIRA::API::ErrorMessage >> on HTTP code 401.

=cut

=head2 C<< DynamicModulesResource_getModules_get >>

  my $res = $client->DynamicModulesResource_getModules_get()->get;

Get modules

Returns a L<< JIRA::API::ConnectModules >> on success.
Returns a L<< JIRA::API::ErrorMessage >> on HTTP code 401.

=cut

=head2 C<< DynamicModulesResource_registerModules_post >>

  my $res = $client->DynamicModulesResource_registerModules_post()->get;

Register modules

Returns a L<< JIRA::API::ErrorMessage >> on error.
Returns a L<< JIRA::API::ErrorMessage >> on HTTP code 401.

=cut

=head2 C<< AppIssueFieldValueUpdateResource_updateIssueFields_put >>

  my $res = $client->AppIssueFieldValueUpdateResource_updateIssueFields_put()->get;

Bulk update custom field value

Returns Hashref on success.

=cut

=head2 C<< MigrationResource_updateEntityPropertiesValue_put >>

  my $res = $client->MigrationResource_updateEntityPropertiesValue_put()->get;

Bulk update entity properties


=cut

=head2 C<< MigrationResource_workflowRuleSearch_post >>

  my $res = $client->MigrationResource_workflowRuleSearch_post()->get;

Get workflow transition rule configurations

Returns a L<< JIRA::API::WorkflowRulesSearchDetails >> on success.

=cut

1;
