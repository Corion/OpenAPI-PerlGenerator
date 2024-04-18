package JIRA::API::AnnouncementBannerConfigurationUpdate 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::AnnouncementBannerConfigurationUpdate -

=head1 SYNOPSIS

  my $obj = JIRA::API::AnnouncementBannerConfigurationUpdate->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< isDismissible >>

Flag indicating if the announcement banner can be dismissed by the user.

=cut

has 'isDismissible' => (
    is       => 'ro',
);

=head2 C<< isEnabled >>

Flag indicating if the announcement banner is enabled or not.

=cut

has 'isEnabled' => (
    is       => 'ro',
);

=head2 C<< message >>

The text on the announcement banner.

=cut

has 'message' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< visibility >>

Visibility of the announcement banner. Can be public or private.

=cut

has 'visibility' => (
    is       => 'ro',
    isa      => Str,
);


1;
