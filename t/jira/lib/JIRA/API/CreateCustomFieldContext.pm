package JIRA::API::CreateCustomFieldContext 0.01;
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

JIRA::API::CreateCustomFieldContext -

=head1 SYNOPSIS

  my $obj = JIRA::API::CreateCustomFieldContext->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< description >>

The description of the context.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< id >>

The ID of the context.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< issueTypeIds >>

The list of issue types IDs for the context. If the list is empty, the context refers to all issue types.

=cut

has 'issueTypeIds' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);

=head2 C<< name >>

The name of the context.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< projectIds >>

The list of project IDs associated with the context. If the list is empty, the context is global.

=cut

has 'projectIds' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);


1;
