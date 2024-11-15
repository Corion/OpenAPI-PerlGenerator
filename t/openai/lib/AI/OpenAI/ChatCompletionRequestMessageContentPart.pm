package AI::OpenAI::ChatCompletionRequestMessageContentPart 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use experimental 'signatures';
use stable 'postderef';
use Carp 'croak';

=head1 NAME

AI::OpenAI::ChatCompletionRequestMessageContentPart - Factory class

=head1 SYNOPSIS

  my $obj = AI::OpenAI::ChatCompletionRequestMessageContentPart->new($args);
  ...

This is a factory class that returns one of the following types
based on the C<<  >> field:


=cut


our %classes = (
);

sub new( $class, $data ) {
    if( ! exists $data->{ '' } ) {
        croak "Need a '' field";
    };
    my $type = $data->{ '' };
    croak "Unknown type '$type' in field ''"
        unless exists $classes{ $type };
    
    return $classes{ $type }->new( $data );
}

1;
