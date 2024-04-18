package JIRA::API::CustomFieldValueUpdate 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::CustomFieldValueUpdate -

=head1 SYNOPSIS

  my $obj = JIRA::API::CustomFieldValueUpdate->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< issueIds >>

The list of issue IDs.

=cut

has 'issueIds' => (
    is       => 'ro',
    isa      => ArrayRef[Int],
    required => 1,
);

=head2 C<< value >>

The value for the custom field. The value must be compatible with the [custom field type](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field/#data-types) as follows:

 *  `string` the value must be a string.
 *  `number` the value must be a number.
 *  `datetime` the value must be a string that represents a date in the ISO format or the simplified extended ISO format. For example, `"2023-01-18T12:00:00-03:00"` or `"2023-01-18T12:00:00.000Z"`. However, the milliseconds part is ignored.
 *  `user` the value must be an object that contains the `accountId` field.
 *  `group` the value must be an object that contains the group `name` or `groupId` field. Because group names can change, we recommend using `groupId`.

A list of appropriate values must be provided if the field is of the `list` [collection type](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field/#collection-types).

=cut

has 'value' => (
    is       => 'ro',
    required => 1,
);


1;
