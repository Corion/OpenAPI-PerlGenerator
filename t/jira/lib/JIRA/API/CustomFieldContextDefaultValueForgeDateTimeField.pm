package JIRA::API::CustomFieldContextDefaultValueForgeDateTimeField 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::CustomFieldContextDefaultValueForgeDateTimeField -

=head1 SYNOPSIS

  my $obj = JIRA::API::CustomFieldContextDefaultValueForgeDateTimeField->new();
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

=head2 C<< dateTime >>

The default date-time in ISO format. Ignored if `useCurrent` is true.

=cut

has 'dateTime' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< type >>

=cut

has 'type' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< useCurrent >>

Whether to use the current date.

=cut

has 'useCurrent' => (
    is       => 'ro',
);


1;
