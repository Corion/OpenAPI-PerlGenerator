package JIRA::API::ServiceManagementNavigationInfo 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::ServiceManagementNavigationInfo -

=head1 SYNOPSIS

  my $obj = JIRA::API::ServiceManagementNavigationInfo->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< queueCategory >>

=cut

has 'queueCategory' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< queueId >>

=cut

has 'queueId' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< queueName >>

=cut

has 'queueName' => (
    is       => 'ro',
    isa      => Str,
);


1;
