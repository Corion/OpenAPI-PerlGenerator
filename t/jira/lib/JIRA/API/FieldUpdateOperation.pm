package JIRA::API::FieldUpdateOperation 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::FieldUpdateOperation -

=head1 SYNOPSIS

  my $obj = JIRA::API::FieldUpdateOperation->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< add >>

The value to add to the field.

=cut

has 'add' => (
    is       => 'ro',
);

=head2 C<< copy >>

The field value to copy from another issue.

=cut

has 'copy' => (
    is       => 'ro',
);

=head2 C<< edit >>

The value to edit in the field.

=cut

has 'edit' => (
    is       => 'ro',
);

=head2 C<< remove >>

The value to removed from the field.

=cut

has 'remove' => (
    is       => 'ro',
);

=head2 C<< set >>

The value to set in the field.

=cut

has 'set' => (
    is       => 'ro',
);


1;
