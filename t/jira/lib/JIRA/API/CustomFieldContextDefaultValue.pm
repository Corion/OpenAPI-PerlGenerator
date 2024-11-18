package JIRA::API::CustomFieldContextDefaultValue 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use experimental 'signatures';
use stable 'postderef';
use Carp 'croak';

=encoding utf8

=head1 NAME

JIRA::API::CustomFieldContextDefaultValue - Factory class

=head1 SYNOPSIS

  my $obj = JIRA::API::CustomFieldContextDefaultValue->new($args);
  ...

This is a factory class that returns one of the following types
based on the C<< type >> field:

C<< datepicker >> - L<< JIRA::API::CustomFieldContextDefaultValueDate >>

C<< datetimepicker >> - L<< JIRA::API::CustomFieldContextDefaultValueDateTime >>

C<< float >> - L<< JIRA::API::CustomFieldContextDefaultValueFloat >>

C<< forge.datetime >> - L<< JIRA::API::CustomFieldContextDefaultValueForgeDateTimeField >>

C<< forge.group >> - L<< JIRA::API::CustomFieldContextDefaultValueForgeGroupField >>

C<< forge.group.list >> - L<< JIRA::API::CustomFieldContextDefaultValueForgeMultiGroupField >>

C<< forge.number >> - L<< JIRA::API::CustomFieldContextDefaultValueForgeNumberField >>

C<< forge.object >> - L<< JIRA::API::CustomFieldContextDefaultValueForgeObjectField >>

C<< forge.string >> - L<< JIRA::API::CustomFieldContextDefaultValueForgeStringField >>

C<< forge.string.list >> - L<< JIRA::API::CustomFieldContextDefaultValueForgeMultiStringField >>

C<< forge.user >> - L<< JIRA::API::CustomFieldContextDefaultValueForgeUserField >>

C<< forge.user.list >> - L<< JIRA::API::CustomFieldContextDefaultValueForgeMultiUserField >>

C<< grouppicker.multiple >> - L<< JIRA::API::CustomFieldContextDefaultValueMultipleGroupPicker >>

C<< grouppicker.single >> - L<< JIRA::API::CustomFieldContextDefaultValueSingleGroupPicker >>

C<< labels >> - L<< JIRA::API::CustomFieldContextDefaultValueLabels >>

C<< multi.user.select >> - L<< JIRA::API::CustomFieldContextDefaultValueMultiUserPicker >>

C<< option.cascading >> - L<< JIRA::API::CustomFieldContextDefaultValueCascadingOption >>

C<< option.multiple >> - L<< JIRA::API::CustomFieldContextDefaultValueMultipleOption >>

C<< option.single >> - L<< JIRA::API::CustomFieldContextDefaultValueSingleOption >>

C<< project >> - L<< JIRA::API::CustomFieldContextDefaultValueProject >>

C<< readonly >> - L<< JIRA::API::CustomFieldContextDefaultValueReadOnly >>

C<< single.user.select >> - L<< JIRA::API::CustomFieldContextSingleUserPickerDefaults >>

C<< textarea >> - L<< JIRA::API::CustomFieldContextDefaultValueTextArea >>

C<< textfield >> - L<< JIRA::API::CustomFieldContextDefaultValueTextField >>

C<< url >> - L<< JIRA::API::CustomFieldContextDefaultValueURL >>

C<< version.multiple >> - L<< JIRA::API::CustomFieldContextDefaultValueMultipleVersionPicker >>

C<< version.single >> - L<< JIRA::API::CustomFieldContextDefaultValueSingleVersionPicker >>


=cut

use JIRA::API::CustomFieldContextDefaultValueCascadingOption;
use JIRA::API::CustomFieldContextDefaultValueDate;
use JIRA::API::CustomFieldContextDefaultValueDateTime;
use JIRA::API::CustomFieldContextDefaultValueFloat;
use JIRA::API::CustomFieldContextDefaultValueForgeDateTimeField;
use JIRA::API::CustomFieldContextDefaultValueForgeGroupField;
use JIRA::API::CustomFieldContextDefaultValueForgeMultiGroupField;
use JIRA::API::CustomFieldContextDefaultValueForgeMultiStringField;
use JIRA::API::CustomFieldContextDefaultValueForgeMultiUserField;
use JIRA::API::CustomFieldContextDefaultValueForgeNumberField;
use JIRA::API::CustomFieldContextDefaultValueForgeObjectField;
use JIRA::API::CustomFieldContextDefaultValueForgeStringField;
use JIRA::API::CustomFieldContextDefaultValueForgeUserField;
use JIRA::API::CustomFieldContextDefaultValueLabels;
use JIRA::API::CustomFieldContextDefaultValueMultiUserPicker;
use JIRA::API::CustomFieldContextDefaultValueMultipleGroupPicker;
use JIRA::API::CustomFieldContextDefaultValueMultipleOption;
use JIRA::API::CustomFieldContextDefaultValueMultipleVersionPicker;
use JIRA::API::CustomFieldContextDefaultValueProject;
use JIRA::API::CustomFieldContextDefaultValueReadOnly;
use JIRA::API::CustomFieldContextDefaultValueSingleGroupPicker;
use JIRA::API::CustomFieldContextDefaultValueSingleOption;
use JIRA::API::CustomFieldContextDefaultValueSingleVersionPicker;
use JIRA::API::CustomFieldContextDefaultValueTextArea;
use JIRA::API::CustomFieldContextDefaultValueTextField;
use JIRA::API::CustomFieldContextDefaultValueURL;
use JIRA::API::CustomFieldContextSingleUserPickerDefaults;


our %classes = (
    'datepicker' => 'JIRA::API::CustomFieldContextDefaultValueDate',
    'datetimepicker' => 'JIRA::API::CustomFieldContextDefaultValueDateTime',
    'float' => 'JIRA::API::CustomFieldContextDefaultValueFloat',
    'forge.datetime' => 'JIRA::API::CustomFieldContextDefaultValueForgeDateTimeField',
    'forge.group' => 'JIRA::API::CustomFieldContextDefaultValueForgeGroupField',
    'forge.group.list' => 'JIRA::API::CustomFieldContextDefaultValueForgeMultiGroupField',
    'forge.number' => 'JIRA::API::CustomFieldContextDefaultValueForgeNumberField',
    'forge.object' => 'JIRA::API::CustomFieldContextDefaultValueForgeObjectField',
    'forge.string' => 'JIRA::API::CustomFieldContextDefaultValueForgeStringField',
    'forge.string.list' => 'JIRA::API::CustomFieldContextDefaultValueForgeMultiStringField',
    'forge.user' => 'JIRA::API::CustomFieldContextDefaultValueForgeUserField',
    'forge.user.list' => 'JIRA::API::CustomFieldContextDefaultValueForgeMultiUserField',
    'grouppicker.multiple' => 'JIRA::API::CustomFieldContextDefaultValueMultipleGroupPicker',
    'grouppicker.single' => 'JIRA::API::CustomFieldContextDefaultValueSingleGroupPicker',
    'labels' => 'JIRA::API::CustomFieldContextDefaultValueLabels',
    'multi.user.select' => 'JIRA::API::CustomFieldContextDefaultValueMultiUserPicker',
    'option.cascading' => 'JIRA::API::CustomFieldContextDefaultValueCascadingOption',
    'option.multiple' => 'JIRA::API::CustomFieldContextDefaultValueMultipleOption',
    'option.single' => 'JIRA::API::CustomFieldContextDefaultValueSingleOption',
    'project' => 'JIRA::API::CustomFieldContextDefaultValueProject',
    'readonly' => 'JIRA::API::CustomFieldContextDefaultValueReadOnly',
    'single.user.select' => 'JIRA::API::CustomFieldContextSingleUserPickerDefaults',
    'textarea' => 'JIRA::API::CustomFieldContextDefaultValueTextArea',
    'textfield' => 'JIRA::API::CustomFieldContextDefaultValueTextField',
    'url' => 'JIRA::API::CustomFieldContextDefaultValueURL',
    'version.multiple' => 'JIRA::API::CustomFieldContextDefaultValueMultipleVersionPicker',
    'version.single' => 'JIRA::API::CustomFieldContextDefaultValueSingleVersionPicker',
);

sub new( $class, $data ) {
    if( ! exists $data->{ 'type' } ) {
        croak "Need a 'type' field";
    };
    my $type = $data->{ 'type' };
    croak "Unknown type '$type' in field 'type'"
        unless exists $classes{ $type };

    return $classes{ $type }->new( $data );
}

1;
