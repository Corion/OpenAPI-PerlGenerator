package JIRA::API::ApplicationProperty 0.01;
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

JIRA::API::ApplicationProperty -

=head1 SYNOPSIS

  my $obj = JIRA::API::ApplicationProperty->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< allowedValues >>

The allowed values, if applicable.

=cut

has 'allowedValues' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);

=head2 C<< defaultValue >>

The default value of the application property.

=cut

has 'defaultValue' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< desc >>

The description of the application property.

=cut

has 'desc' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< example >>

=cut

has 'example' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< id >>

The ID of the application property. The ID and key are the same.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< key >>

The key of the application property. The ID and key are the same.

=cut

has 'key' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the application property.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< type >>

The data type of the application property.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< value >>

The new value.

=cut

has 'value' => (
    is       => 'ro',
    isa      => Str,
);


1;
