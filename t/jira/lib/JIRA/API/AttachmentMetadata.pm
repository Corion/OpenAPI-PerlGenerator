package JIRA::API::AttachmentMetadata 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::AttachmentMetadata -

=head1 SYNOPSIS

  my $obj = JIRA::API::AttachmentMetadata->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< author >>

Details of the user who attached the file.

=cut

has 'author' => (
    is       => 'ro',
);

=head2 C<< content >>

The URL of the attachment.

=cut

has 'content' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< created >>

The datetime the attachment was created.

=cut

has 'created' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< filename >>

The name of the attachment file.

=cut

has 'filename' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< id >>

The ID of the attachment.

=cut

has 'id' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< mimeType >>

The MIME type of the attachment.

=cut

has 'mimeType' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< properties >>

Additional properties of the attachment.

=cut

has 'properties' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< self >>

The URL of the attachment metadata details.

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< size >>

The size of the attachment.

=cut

has 'size' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< thumbnail >>

The URL of a thumbnail representing the attachment.

=cut

has 'thumbnail' => (
    is       => 'ro',
    isa      => Str,
);


1;
