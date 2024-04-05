package JIRA::API::Transitions 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::Transitions -

=head1 SYNOPSIS

  my $obj = JIRA::API::Transitions->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< expand >>

Expand options that include additional transitions details in the response.

=cut

has 'expand' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< transitions >>

List of issue transitions.

=cut

has 'transitions' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);


1;
