package JIRA::API::IssueTypeSchemeMapping 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::IssueTypeSchemeMapping -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssueTypeSchemeMapping->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< issueTypeId >>

The ID of the issue type.

=cut

has 'issueTypeId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< issueTypeSchemeId >>

The ID of the issue type scheme.

=cut

has 'issueTypeSchemeId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
