package JIRA::API::AttachmentArchiveImpl 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::AttachmentArchiveImpl -

=head1 SYNOPSIS

  my $obj = JIRA::API::AttachmentArchiveImpl->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< entries >>

The list of the items included in the archive.

=cut

has 'entries' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< totalEntryCount >>

The number of items in the archive.

=cut

has 'totalEntryCount' => (
    is       => 'ro',
    isa      => Int,
);


1;
