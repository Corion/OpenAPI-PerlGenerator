package More::TestCases::Client 0.01;
use 5.020;
use Moo 2;
use experimental 'signatures';

extends 'More::TestCases::Client::Impl';

=encoding utf8

=head1 NAME

More::TestCases::Client - Client for More::TestCases

=head1 SYNOPSIS

  use 5.020;
  use More::TestCases::Client;

  my $client = More::TestCases::Client->new(
      schema_file => '...',
      server => 'https://example.com/v0',
  );
  my $res = $client->someMethod()->get;
  say $res;

=head1 METHODS

=head2 C<< withCookie >>

  my $res = $client->withCookie()->get;


=cut

=head2 C<< withHeader >>

  my $res = $client->withHeader()->get;


=cut

1;
