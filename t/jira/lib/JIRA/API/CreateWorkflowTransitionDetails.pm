package JIRA::API::CreateWorkflowTransitionDetails 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::CreateWorkflowTransitionDetails -

=head1 SYNOPSIS

  my $obj = JIRA::API::CreateWorkflowTransitionDetails->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< description >>

The description of the transition. The maximum length is 1000 characters.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< from >>

The statuses the transition can start from.

=cut

has 'from' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);

=head2 C<< name >>

The name of the transition. The maximum length is 60 characters.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< properties >>

The properties of the transition.

=cut

has 'properties' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< rules >>

The rules of the transition.

=cut

has 'rules' => (
    is       => 'ro',
);

=head2 C<< screen >>

The screen of the transition.

=cut

has 'screen' => (
    is       => 'ro',
);

=head2 C<< to >>

The status the transition goes to.

=cut

has 'to' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< type >>

The type of the transition.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Enum[
        "global",
        "initial",
        "directed",
    ],
    required => 1,
);


1;
