package AI::OpenAPI::ChatCompletionFunctionCallOption 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

AI::OpenAPI::ChatCompletionFunctionCallOption -

=head1 SYNOPSIS

  my $obj = AI::OpenAPI::ChatCompletionFunctionCallOption->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< name >>

The name of the function to call.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
