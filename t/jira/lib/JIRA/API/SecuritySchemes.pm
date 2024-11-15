package JIRA::API::SecuritySchemes 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::SecuritySchemes -

=head1 SYNOPSIS

  my $obj = JIRA::API::SecuritySchemes->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< issueSecuritySchemes >>

List of security schemes.

=cut

has 'issueSecuritySchemes' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);


1;
