package JIRA::API::IssueContextVariable 0.01;
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

JIRA::API::IssueContextVariable -

=head1 SYNOPSIS

  my $obj = JIRA::API::IssueContextVariable->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< id >>

The issue ID.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< key >>

The issue key.

=cut

has 'key' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< type >>

Type of custom context variable.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
