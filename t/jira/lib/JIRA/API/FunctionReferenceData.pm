package JIRA::API::FunctionReferenceData 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::FunctionReferenceData -

=head1 SYNOPSIS

  my $obj = JIRA::API::FunctionReferenceData->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< displayName >>

The display name of the function.

=cut

has 'displayName' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< isList >>

Whether the function can take a list of arguments.

=cut

has 'isList' => (
    is       => 'ro',
    isa      => Enum[
        "true",
        "false",
    ],
);

=head2 C<< types >>

The data types returned by the function.

=cut

has 'types' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);

=head2 C<< value >>

The function identifier.

=cut

has 'value' => (
    is       => 'ro',
    isa      => Str,
);


1;
