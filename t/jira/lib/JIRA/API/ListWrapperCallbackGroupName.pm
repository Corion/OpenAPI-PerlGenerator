package JIRA::API::ListWrapperCallbackGroupName 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::ListWrapperCallbackGroupName -

=head1 SYNOPSIS

  my $obj = JIRA::API::ListWrapperCallbackGroupName->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES


1;
