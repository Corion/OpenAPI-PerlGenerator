package AI::OpenAI::RunStepStreamEvent 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use experimental 'signatures';
use stable 'postderef';
use Carp 'croak';

=encoding utf8

=head1 NAME

AI::OpenAI::RunStepStreamEvent - Factory class

=head1 SYNOPSIS

  my $obj = AI::OpenAI::RunStepStreamEvent->new($args);
  ...

This is a factory class that returns one of the following types
based on the C<< event >> field:

C<< thread.run.step.cancelled >> - L<< HashRef >>

C<< thread.run.step.completed >> - L<< HashRef >>

C<< thread.run.step.created >> - L<< HashRef >>

C<< thread.run.step.delta >> - L<< HashRef >>

C<< thread.run.step.expired >> - L<< HashRef >>

C<< thread.run.step.failed >> - L<< HashRef >>

C<< thread.run.step.in_progress >> - L<< HashRef >>


=cut


our %classes = (
    'thread.run.step.cancelled' => 'HashRef',
    'thread.run.step.completed' => 'HashRef',
    'thread.run.step.created' => 'HashRef',
    'thread.run.step.delta' => 'HashRef',
    'thread.run.step.expired' => 'HashRef',
    'thread.run.step.failed' => 'HashRef',
    'thread.run.step.in_progress' => 'HashRef',
);

sub new( $class, $data ) {
    if( ! exists $data->{ 'event' } ) {
        croak "Need a 'event' field";
    };
    my $type = $data->{ 'event' };
    croak "Unknown type '$type' in field 'event'"
        unless exists $classes{ $type };

    return $classes{ $type }->new( $data );
}

1;
