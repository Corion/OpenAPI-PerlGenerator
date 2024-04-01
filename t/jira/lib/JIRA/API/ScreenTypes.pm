package JIRA::API::ScreenTypes 0.01;
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

=head2 C<< create >>

The ID of the create screen.

=cut

has 'create' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< default >>

The ID of the default screen. Required when creating a screen scheme.

=cut

has 'default' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< edit >>

The ID of the edit screen.

=cut

has 'edit' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< view >>

The ID of the view screen.

=cut

has 'view' => (
    is       => 'ro',
    isa      => Int,
);


1;
