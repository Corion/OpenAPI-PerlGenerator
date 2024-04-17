package JIRA::API::IssueTypeScreenSchemeDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::IssueTypeScreenSchemeDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssueTypeScreenSchemeDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< description >>

The description of the issue type screen scheme. The maximum length is 255 characters.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< issueTypeMappings >>

The IDs of the screen schemes for the issue type IDs and *default*. A *default* entry is required to create an issue type screen scheme, it defines the mapping for all issue types without a screen scheme.

=cut

has 'issueTypeMappings' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
    required => 1,
);

=head2 C<< name >>

The name of the issue type screen scheme. The name must be unique. The maximum length is 255 characters.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
