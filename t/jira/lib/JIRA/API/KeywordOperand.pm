package JIRA::API::KeywordOperand 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::KeywordOperand -

=head1 SYNOPSIS

  my $obj = JIRA::API::KeywordOperand->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< keyword >>

The keyword that is the operand value.

=cut

has 'keyword' => (
    is       => 'ro',
    isa      => Enum[
        "empty",
    ],
    required => 1,
);


1;
