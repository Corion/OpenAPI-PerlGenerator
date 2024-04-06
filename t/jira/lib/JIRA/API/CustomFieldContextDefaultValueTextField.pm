package JIRA::API::CustomFieldContextDefaultValueTextField 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::CustomFieldContextDefaultValueTextField -

=head1 SYNOPSIS

  my $obj = JIRA::API::CustomFieldContextDefaultValueTextField->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< text >>

The default text. The maximum length is 254 characters.

=cut

has 'text' => (
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


1;