package JIRA::API::DefaultShareScope 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::DefaultShareScope -

=head1 SYNOPSIS

  my $obj = JIRA::API::DefaultShareScope->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< scope >>

The scope of the default sharing for new filters and dashboards:

 *  `AUTHENTICATED` Shared with all logged-in users.
 *  `GLOBAL` Shared with all logged-in users. This shows as `AUTHENTICATED` in the response.
 *  `PRIVATE` Not shared with any users.

=cut

has 'scope' => (
    is       => 'ro',
    isa      => Enum[
        "GLOBAL",
        "AUTHENTICATED",
        "PRIVATE",
    ],
    required => 1,
);


1;
