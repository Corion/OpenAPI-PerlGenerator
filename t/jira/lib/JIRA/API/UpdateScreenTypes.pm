package JIRA::API::UpdateScreenTypes 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::UpdateScreenTypes -

=head1 SYNOPSIS

  my $obj = JIRA::API::UpdateScreenTypes->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< create >>

The ID of the create screen. To remove the screen association, pass a null.

=cut

has 'create' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< default >>

The ID of the default screen. When specified, must include a screen ID as a default screen is required.

=cut

has 'default' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< edit >>

The ID of the edit screen. To remove the screen association, pass a null.

=cut

has 'edit' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< view >>

The ID of the view screen. To remove the screen association, pass a null.

=cut

has 'view' => (
    is       => 'ro',
    isa      => Str,
);


1;
