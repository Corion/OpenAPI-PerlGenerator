package JIRA::API::ListWrapperCallbackApplicationRole 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

JIRA::API::ListWrapperCallbackApplicationRole -

=head1 SYNOPSIS

  my $obj = JIRA::API::ListWrapperCallbackApplicationRole->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES


1;
