package JIRA::API::CustomFieldOptionCreate 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

use namespace::clean;

=encoding utf8

=head1 NAME

JIRA::API::CustomFieldOptionCreate -

=head1 SYNOPSIS

  my $obj = JIRA::API::CustomFieldOptionCreate->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< disabled >>

Whether the option is disabled.

=cut

has 'disabled' => (
    is       => 'ro',
);

=head2 C<< optionId >>

For cascading options, the ID of the custom field object containing the cascading option.

=cut

has 'optionId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< value >>

The value of the custom field option.

=cut

has 'value' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
