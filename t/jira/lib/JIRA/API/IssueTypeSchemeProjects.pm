package JIRA::API::IssueTypeSchemeProjects 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::IssueTypeSchemeProjects -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssueTypeSchemeProjects->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< issueTypeScheme >>

Details of an issue type scheme.

=cut

has 'issueTypeScheme' => (
    is       => 'ro',
    required => 1,
);

=head2 C<< projectIds >>

The IDs of the projects using the issue type scheme.

=cut

has 'projectIds' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
    required => 1,
);


1;
