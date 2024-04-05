package JIRA::API::ScreenableTab 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::ScreenableTab -

=head1 SYNOPSIS

  my $obj = JIRA::API::ScreenableTab->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< id >>

The ID of the screen tab.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< name >>

The name of the screen tab. The maximum length is 255 characters.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
