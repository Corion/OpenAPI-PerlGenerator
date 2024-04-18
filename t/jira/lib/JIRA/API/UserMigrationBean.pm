package JIRA::API::UserMigrationBean 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::UserMigrationBean -

=head1 SYNOPSIS

  my $obj = JIRA::API::UserMigrationBean->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< accountId >>

=cut

has 'accountId' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< key >>

=cut

has 'key' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< username >>

=cut

has 'username' => (
    is       => 'ro',
    isa      => Str,
);


1;
