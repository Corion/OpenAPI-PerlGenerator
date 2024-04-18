package JIRA::API::CustomFieldContextSingleUserPickerDefaults 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::CustomFieldContextSingleUserPickerDefaults -

=head1 SYNOPSIS

  my $obj = JIRA::API::CustomFieldContextSingleUserPickerDefaults->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< accountId >>

The ID of the default user.

=cut

has 'accountId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< contextId >>

The ID of the context.

=cut

has 'contextId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< type >>

=cut

has 'type' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< userFilter >>

Filter for a User Picker (single) custom field.

=cut

has 'userFilter' => (
    is       => 'ro',
    isa      => Object,
    required => 1,
);


1;
