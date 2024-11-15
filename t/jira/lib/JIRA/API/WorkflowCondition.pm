package JIRA::API::WorkflowCondition 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use experimental 'signatures';
use stable 'postderef';
use Carp 'croak';

=head1 NAME

JIRA::API::WorkflowCondition - Factory class

=head1 SYNOPSIS

  my $obj = JIRA::API::WorkflowCondition->new($args);
  ...

This is a factory class that returns one of the following types
based on the C<< nodeType >> field:

C<< compound >> - L<< JIRA::API::WorkflowCompoundCondition >>

C<< simple >> - L<< JIRA::API::WorkflowSimpleCondition >>


=cut

use JIRA::API::WorkflowCompoundCondition;
use JIRA::API::WorkflowSimpleCondition;


our %classes = (
    'compound' => 'JIRA::API::WorkflowCompoundCondition',
    'simple' => 'JIRA::API::WorkflowSimpleCondition',
);

sub new( $class, $data ) {
    if( ! exists $data->{ 'nodeType' } ) {
        croak "Need a 'nodeType' field";
    };
    my $type = $data->{ 'nodeType' };
    croak "Unknown type '$type' in field 'nodeType'"
        unless exists $classes{ $type };
    
    return $classes{ $type }->new( $data );
}

1;
