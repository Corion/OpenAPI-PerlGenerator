package JIRA::API::AttachmentArchive 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::AttachmentArchive -

=head1 SYNOPSIS

  my $obj = JIRA::API::AttachmentArchive->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< entries >>

=cut

has 'entries' => (
    is       => 'ro',
    isa      => ArrayRef[Object],
);

=head2 C<< moreAvailable >>

=cut

has 'moreAvailable' => (
    is       => 'ro',
);

=head2 C<< totalEntryCount >>

=cut

has 'totalEntryCount' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< totalNumberOfEntriesAvailable >>

=cut

has 'totalNumberOfEntriesAvailable' => (
    is       => 'ro',
    isa      => Int,
);


1;
