package JIRA::API::SimpleListWrapperGroupName 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::SimpleListWrapperGroupName -

=head1 SYNOPSIS

  my $obj = JIRA::API::SimpleListWrapperGroupName->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< callback >>

=cut

has 'callback' => (
    is       => 'ro',
    isa      => Object,
);

=head2 C<< items >>

=cut

has 'items' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< max_results >>

=cut

has 'max_results' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< pagingCallback >>

=cut

has 'pagingCallback' => (
    is       => 'ro',
    isa      => Object,
);

=head2 C<< size >>

=cut

has 'size' => (
    is       => 'ro',
    isa      => Int,
);


1;
