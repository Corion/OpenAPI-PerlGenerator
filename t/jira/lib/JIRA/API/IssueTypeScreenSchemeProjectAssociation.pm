package JIRA::API::IssueTypeScreenSchemeProjectAssociation 0.01;
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

JIRA::API::IssueTypeScreenSchemeProjectAssociation -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssueTypeScreenSchemeProjectAssociation->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< issueTypeScreenSchemeId >>

The ID of the issue type screen scheme.

=cut

has 'issueTypeScreenSchemeId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< projectId >>

The ID of the project.

=cut

has 'projectId' => (
    is       => 'ro',
    isa      => Str,
);


1;
