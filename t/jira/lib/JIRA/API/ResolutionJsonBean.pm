package JIRA::API::ResolutionJsonBean 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::ResolutionJsonBean -

=head1 SYNOPSIS

  my $obj = JIRA::API::ResolutionJsonBean->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< default >>

=cut

has 'default' => (
    is       => 'ro',
);

=head2 C<< description >>

=cut

has 'description' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< iconUrl >>

=cut

has 'iconUrl' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< id >>

=cut

has 'id' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< name >>

=cut

has 'name' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< self >>

=cut

has 'self' => (
    is       => 'ro',
    isa      => Str,
);


1;