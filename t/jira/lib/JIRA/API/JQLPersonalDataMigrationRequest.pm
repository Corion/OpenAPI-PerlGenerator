package JIRA::API::JQLPersonalDataMigrationRequest 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::JQLPersonalDataMigrationRequest -

=head1 SYNOPSIS

  my $obj = JIRA::API::JQLPersonalDataMigrationRequest->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< queryStrings >>

A list of queries with user identifiers. Maximum of 100 queries.

=cut

has 'queryStrings' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);


1;
