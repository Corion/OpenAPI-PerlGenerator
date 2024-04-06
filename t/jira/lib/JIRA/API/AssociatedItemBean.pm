package JIRA::API::AssociatedItemBean 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::AssociatedItemBean -

=head1 SYNOPSIS

  my $obj = JIRA::API::AssociatedItemBean->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< id >>

The ID of the associated record.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the associated record.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< parentId >>

The ID of the associated parent record.

=cut

has 'parentId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< parentName >>

The name of the associated parent record.

=cut

has 'parentName' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< typeName >>

The type of the associated record.

=cut

has 'typeName' => (
    is       => 'ro',
    isa      => Str,
);


1;