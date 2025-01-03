package JIRA::API::JiraExpressionEvaluationMetaDataBean 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

use namespace::clean;

=encoding utf8

=head1 NAME

JIRA::API::JiraExpressionEvaluationMetaDataBean -

=head1 SYNOPSIS

  my $obj = JIRA::API::JiraExpressionEvaluationMetaDataBean->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< complexity >>

Contains information about the expression complexity. For example, the number of steps it took to evaluate the expression.

=cut

has 'complexity' => (
    is       => 'ro',
);

=head2 C<< issues >>

Contains information about the `issues` variable in the context. For example, is the issues were loaded with JQL, information about the page will be included here.

=cut

has 'issues' => (
    is       => 'ro',
);


1;
