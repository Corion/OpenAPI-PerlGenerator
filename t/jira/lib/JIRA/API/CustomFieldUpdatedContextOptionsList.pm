package JIRA::API::CustomFieldUpdatedContextOptionsList 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::CustomFieldUpdatedContextOptionsList -

=head1 SYNOPSIS

  my $obj = JIRA::API::CustomFieldUpdatedContextOptionsList->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< options >>

The updated custom field options.

=cut

has 'options' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);


1;
