package JIRA::API::IssueTypeSchemeProjectAssociation 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::IssueTypeSchemeProjectAssociation -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssueTypeSchemeProjectAssociation->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< issueTypeSchemeId >>

The ID of the issue type scheme.

=cut

has 'issueTypeSchemeId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< projectId >>

The ID of the project.

=cut

has 'projectId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
