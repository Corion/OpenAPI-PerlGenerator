package JIRA::API::ConnectModules 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::ConnectModules -

=head1 SYNOPSIS

  my $obj = JIRA::API::ConnectModules->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< modules >>

A list of app modules in the same format as the `modules` property in the
[app descriptor](https://developer.atlassian.com/cloud/jira/platform/app-descriptor/).

=cut

has 'modules' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
    required => 1,
);


1;