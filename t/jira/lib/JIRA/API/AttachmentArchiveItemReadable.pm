package JIRA::API::AttachmentArchiveItemReadable 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::AttachmentArchiveItemReadable -

=head1 SYNOPSIS

  my $obj = JIRA::API::AttachmentArchiveItemReadable->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< index >>

The position of the item within the archive.

=cut

has 'index' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< label >>

The label for the archive item.

=cut

has 'label' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< mediaType >>

The MIME type of the archive item.

=cut

has 'mediaType' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< path >>

The path of the archive item.

=cut

has 'path' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< size >>

The size of the archive item.

=cut

has 'size' => (
    is       => 'ro',
    isa      => Str,
);


1;
