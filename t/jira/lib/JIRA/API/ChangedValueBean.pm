package JIRA::API::ChangedValueBean 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::ChangedValueBean -

=head1 SYNOPSIS

  my $obj = JIRA::API::ChangedValueBean->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< changedFrom >>

The value of the field before the change.

=cut

has 'changedFrom' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< changedTo >>

The value of the field after the change.

=cut

has 'changedTo' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< fieldName >>

The name of the field changed.

=cut

has 'fieldName' => (
    is       => 'ro',
    isa      => Str,
);


1;