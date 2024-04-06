package JIRA::API::Application 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::Application -

=head1 SYNOPSIS

  my $obj = JIRA::API::Application->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< name >>

The name of the application. Used in conjunction with the (remote) object icon title to display a tooltip for the link's icon. The tooltip takes the format "\[application name\] icon title". Blank items are excluded from the tooltip title. If both items are blank, the icon tooltop displays as "Web Link". Grouping and sorting of links may place links without an application name last.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< type >>

The name-spaced type of the application, used by registered rendering apps.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Str,
);


1;