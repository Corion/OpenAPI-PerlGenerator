package JIRA::API::UpdateCustomFieldDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< description >>

The description of the custom field. The maximum length is 40000 characters.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the custom field. It doesn't have to be unique. The maximum length is 255 characters.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< searcherKey >>

The searcher that defines the way the field is searched in Jira. It can be set to `null`, otherwise you must specify the valid searcher for the field type, as listed below (abbreviated values shown):

 *  `cascadingselect`: `cascadingselectsearcher`
 *  `datepicker`: `daterange`
 *  `datetime`: `datetimerange`
 *  `float`: `exactnumber` or `numberrange`
 *  `grouppicker`: `grouppickersearcher`
 *  `importid`: `exactnumber` or `numberrange`
 *  `labels`: `labelsearcher`
 *  `multicheckboxes`: `multiselectsearcher`
 *  `multigrouppicker`: `multiselectsearcher`
 *  `multiselect`: `multiselectsearcher`
 *  `multiuserpicker`: `userpickergroupsearcher`
 *  `multiversion`: `versionsearcher`
 *  `project`: `projectsearcher`
 *  `radiobuttons`: `multiselectsearcher`
 *  `readonlyfield`: `textsearcher`
 *  `select`: `multiselectsearcher`
 *  `textarea`: `textsearcher`
 *  `textfield`: `textsearcher`
 *  `url`: `exacttextsearcher`
 *  `userpicker`: `userpickergroupsearcher`
 *  `version`: `versionsearcher`

=cut

has 'searcherKey' => (
    is       => 'ro',
    isa      => Str,
);


1;
