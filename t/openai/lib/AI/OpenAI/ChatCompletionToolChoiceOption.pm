package AI::OpenAI::ChatCompletionToolChoiceOption 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use experimental 'signatures';
use stable 'postderef';

=head1 NAME

AI::OpenAI::ChatCompletionToolChoiceOption -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::ChatCompletionToolChoiceOption->new($args);
  ...

This is a factory class that returns one of the following types:

L< AI::OpenAI::ChatCompletionNamedToolChoice >

=cut

use AI::OpenAI::ChatCompletionNamedToolChoice;


sub new( $class, $data ) {
# But how do we find out which subclass is the correct one?!
# We could dynamically try all the variants and the first we successfully
# construct must be the right one ?!
}

1;
