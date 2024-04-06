package JIRA::API::JqlFunctionPrecomputationUpdateBean 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::JqlFunctionPrecomputationUpdateBean -

=head1 SYNOPSIS

  my $obj = JIRA::API::JqlFunctionPrecomputationUpdateBean->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< id >>

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< value >>

=cut

has 'value' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;