package JIRA::API::CustomFieldContextDefaultValueDate 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::CustomFieldContextDefaultValueDate -

=head1 SYNOPSIS

  my $obj = JIRA::API::CustomFieldContextDefaultValueDate->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< date >>

The default date in ISO format. Ignored if `useCurrent` is true.

=cut

has 'date' => (
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
