package JIRA::API::ProjectFeature 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::ProjectFeature -

=head1 SYNOPSIS

  my $obj = JIRA::API::ProjectFeature->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< feature >>

The key of the feature.

=cut

has 'feature' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< imageUri >>

URI for the image representing the feature.

=cut

has 'imageUri' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< localisedDescription >>

Localized display description for the feature.

=cut

has 'localisedDescription' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< localisedName >>

Localized display name for the feature.

=cut

has 'localisedName' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< prerequisites >>

List of keys of the features required to enable the feature.

=cut

has 'prerequisites' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);

=head2 C<< projectId >>

The ID of the project.

=cut

has 'projectId' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< state >>

The state of the feature. When updating the state of a feature, only ENABLED and DISABLED are supported. Responses can contain all values

=cut

has 'state' => (
    is       => 'ro',
    isa      => Enum[
        "ENABLED",
        "DISABLED",
        "COMING_SOON",
    ],
);

=head2 C<< toggleLocked >>

Whether the state of the feature can be updated.

=cut

has 'toggleLocked' => (
    is       => 'ro',
);


1;
