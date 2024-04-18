package JIRA::API::IssueTypeScreenSchemesProjects 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::IssueTypeScreenSchemesProjects -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssueTypeScreenSchemesProjects->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< issueTypeScreenScheme >>

Details of an issue type screen scheme.

=cut

has 'issueTypeScreenScheme' => (
    is       => 'ro',
    required => 1,
);

=head2 C<< projectIds >>

The IDs of the projects using the issue type screen scheme.

=cut

has 'projectIds' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
    required => 1,
);


1;
