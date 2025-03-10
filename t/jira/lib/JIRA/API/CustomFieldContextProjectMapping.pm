package JIRA::API::CustomFieldContextProjectMapping 0.01;
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

JIRA::API::CustomFieldContextProjectMapping -

=head1 SYNOPSIS

  my $obj = JIRA::API::CustomFieldContextProjectMapping->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< contextId >>

The ID of the context.

=cut

has 'contextId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< isGlobalContext >>

Whether context is global.

=cut

has 'isGlobalContext' => (
    is       => 'ro',
);

=head2 C<< projectId >>

The ID of the project.

=cut

has 'projectId' => (
    is       => 'ro',
    isa      => Str,
);


1;
