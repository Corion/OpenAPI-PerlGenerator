package JIRA::API::HistoryMetadata 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::HistoryMetadata -

=head1 SYNOPSIS

  my $obj = JIRA::API::HistoryMetadata->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< activityDescription >>

The activity described in the history record.

=cut

has 'activityDescription' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< activityDescriptionKey >>

The key of the activity described in the history record.

=cut

has 'activityDescriptionKey' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< actor >>

Details of the user whose action created the history record.

=cut

has 'actor' => (
    is       => 'ro',
);

=head2 C<< cause >>

Details of the cause that triggered the creation the history record.

=cut

has 'cause' => (
    is       => 'ro',
);

=head2 C<< description >>

The description of the history record.

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< descriptionKey >>

The description key of the history record.

=cut

has 'descriptionKey' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< emailDescription >>

The description of the email address associated the history record.

=cut

has 'emailDescription' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< emailDescriptionKey >>

The description key of the email address associated the history record.

=cut

has 'emailDescriptionKey' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< extraData >>

Additional arbitrary information about the history record.

=cut

has 'extraData' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< generator >>

Details of the system that generated the history record.

=cut

has 'generator' => (
    is       => 'ro',
);

=head2 C<< type >>

The type of the history record.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Str,
);


1;
