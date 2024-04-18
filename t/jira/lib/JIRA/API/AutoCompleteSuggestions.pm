package JIRA::API::AutoCompleteSuggestions 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::AutoCompleteSuggestions -

=head1 SYNOPSIS

  my $obj = JIRA::API::AutoCompleteSuggestions->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< results >>

The list of suggested item.

=cut

has 'results' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);


1;
