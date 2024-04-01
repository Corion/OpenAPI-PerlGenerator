package JIRA::API::Attachment 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< author >>

Details of the user who added the attachment.

=cut

has 'author' => (
    is       => 'ro',
);

=head2 C<< content >>

The content of the attachment.

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

The file name of the attachment.

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
    isa      => Str,
);

=head2 C<< mimeType >>

The MIME type of the attachment.

=cut

has 'mimeType' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< self >>

The URL of the attachment details response.

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
