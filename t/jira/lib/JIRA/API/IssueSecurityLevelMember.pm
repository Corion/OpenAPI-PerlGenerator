package JIRA::API::IssueSecurityLevelMember 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::IssueSecurityLevelMember -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssueSecurityLevelMember->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< holder >>

The user or group being granted the permission. It consists of a `type` and a type-dependent `parameter`. See [Holder object](../api-group-permission-schemes/#holder-object) in *Get all permission schemes* for more information.

=cut

has 'holder' => (
    is       => 'ro',
    required => 1,
);

=head2 C<< id >>

The ID of the issue security level member.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< issueSecurityLevelId >>

The ID of the issue security level.

=cut

has 'issueSecurityLevelId' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);


1;
