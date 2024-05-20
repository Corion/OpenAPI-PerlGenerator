package AI::OpenAPI::ChatCompletionFunctions 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

AI::OpenAPI::ChatCompletionFunctions -

=head1 SYNOPSIS

  my $obj = AI::OpenAPI::ChatCompletionFunctions->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< description >>

A description of what the function does, used by the model to choose when and how to call the function.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< parameters >>

The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/text-generation/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format. 

Omitting `parameters` defines a function with an empty parameter list.

=cut

has 'parameters' => (
    is       => 'ro',
    isa      => HashRef,
);


1;
