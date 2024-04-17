package JIRA::API::UserContextVariable 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::UserContextVariable -

=head1 SYNOPSIS

  my $obj = JIRA::API::UserContextVariable->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< accountId >>

The account ID of the user.

=cut

has 'accountId' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< type >>

Type of custom context variable.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
