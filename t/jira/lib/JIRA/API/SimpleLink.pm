package JIRA::API::SimpleLink 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::SimpleLink -

=head1 SYNOPSIS

  my $obj = JIRA::API::SimpleLink->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< href >>

=cut

has 'href' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< iconClass >>

=cut

has 'iconClass' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< id >>

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< label >>

=cut

has 'label' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< styleClass >>

=cut

has 'styleClass' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< title >>

=cut

has 'title' => (
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
