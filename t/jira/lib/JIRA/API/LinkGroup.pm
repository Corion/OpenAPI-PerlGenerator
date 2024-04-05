package JIRA::API::LinkGroup 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::LinkGroup -

=head1 SYNOPSIS

  my $obj = JIRA::API::LinkGroup->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< groups >>

=cut

has 'groups' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< header >>

Details about the operations available in this version.

=cut

has 'header' => (
    is       => 'ro',
    isa      => Object,
);

=head2 C<< id >>

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< links >>

=cut

has 'links' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< styleClass >>

=cut

has 'styleClass' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< weight >>

=cut

has 'weight' => (
    is       => 'ro',
    isa      => Int,
);


1;
