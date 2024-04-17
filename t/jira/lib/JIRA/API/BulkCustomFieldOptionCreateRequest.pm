package JIRA::API::BulkCustomFieldOptionCreateRequest 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::BulkCustomFieldOptionCreateRequest -

=head1 SYNOPSIS

  my $obj = JIRA::API::BulkCustomFieldOptionCreateRequest->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< options >>

Details of options to create.

=cut

has 'options' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);


1;
