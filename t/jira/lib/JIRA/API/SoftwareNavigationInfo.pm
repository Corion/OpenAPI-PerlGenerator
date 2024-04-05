package JIRA::API::SoftwareNavigationInfo 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::SoftwareNavigationInfo -

=head1 SYNOPSIS

  my $obj = JIRA::API::SoftwareNavigationInfo->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< boardId >>

=cut

has 'boardId' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< boardName >>

=cut

has 'boardName' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< simpleBoard >>

=cut

has 'simpleBoard' => (
    is       => 'ro',
);

=head2 C<< totalBoardsInProject >>

=cut

has 'totalBoardsInProject' => (
    is       => 'ro',
    isa      => Int,
);


1;
