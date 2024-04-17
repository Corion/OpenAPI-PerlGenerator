package JIRA::API::IncludedFields 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::IncludedFields -

=head1 SYNOPSIS

  my $obj = JIRA::API::IncludedFields->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< actuallyIncluded >>

=cut

has 'actuallyIncluded' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);

=head2 C<< excluded >>

=cut

has 'excluded' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);

=head2 C<< included >>

=cut

has 'included' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);


1;
