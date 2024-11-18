package JIRA::API::FieldConfigurationToIssueTypeMapping 0.01;
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

JIRA::API::FieldConfigurationToIssueTypeMapping -

=head1 SYNOPSIS

  my $obj = JIRA::API::FieldConfigurationToIssueTypeMapping->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< fieldConfigurationId >>

The ID of the field configuration.

=cut

has 'fieldConfigurationId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< issueTypeId >>

The ID of the issue type or *default*. When set to *default* this field configuration issue type item applies to all issue types without a field configuration. An issue type can be included only once in a request.

=cut

has 'issueTypeId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
