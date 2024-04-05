package JIRA::API::Status 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::Status -

=head1 SYNOPSIS

  my $obj = JIRA::API::Status->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< icon >>

Details of the icon representing the status. If not provided, no status icon displays in Jira.

=cut

has 'icon' => (
    is       => 'ro',
);

=head2 C<< resolved >>

Whether the item is resolved. If set to "true", the link to the issue is displayed in a strikethrough font, otherwise the link displays in normal font.

=cut

has 'resolved' => (
    is       => 'ro',
);


1;
