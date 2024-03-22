package Speech::Recognition::Whisper::Client 0.01;
use 5.020;
use Moo 2;
use experimental 'signatures';

extends 'Speech::Recognition::Whisper::Client::Impl';

=head1 NAME

Speech::Recognition::Whisper::Client - Client for Speech::Recognition::Whisper

=head1 SYNOPSIS

  use 5.020;
  use Speech::Recognition::Whisper::Client;

  my $client = Speech::Recognition::Whisper::Client->new(
      server => 'https://example.com/',
  );
  my $res = $client->someMethod()->get;
  say $res;

=head1 METHODS

=head2 C<< transcribe >>

  my $res = $client->transcribe()->get;

Post Audio

Returns a L<< Speech::Recognition::Whisper::Transcription >>.
Returns a L<< Speech::Recognition::Whisper::HTTPValidationError >>.

=cut

=head2 C<< create_user >>

  my $res = $client->create_user()->get;

Create User

Returns a L<< Speech::Recognition::Whisper::UserResponse >>.
Returns a L<< Speech::Recognition::Whisper::HTTPValidationError >>.

=cut

=head2 C<< get_user_token >>

  my $res = $client->get_user_token()->get;

Get User Token

Returns a L<< Speech::Recognition::Whisper::Response_Token >>.
Returns a L<< Speech::Recognition::Whisper::HTTPValidationError >>.

=cut

=head2 C<< read_user >>

  my $res = $client->read_user()->get;

Read User

Returns a L<< Speech::Recognition::Whisper::UserResponse >>.
Returns a L<< Speech::Recognition::Whisper::HTTPValidationError >>.

=cut

=head2 C<< delete_user >>

  my $res = $client->delete_user()->get;

Delete User

Returns a L<< Speech::Recognition::Whisper::UserDeletedResponse >>.
Returns a L<< Speech::Recognition::Whisper::HTTPValidationError >>.

=cut

=head2 C<< update_password >>

  my $res = $client->update_password()->get;

Update Password

Returns a L<< Speech::Recognition::Whisper::UserResponse >>.
Returns a L<< Speech::Recognition::Whisper::HTTPValidationError >>.

=cut

=head2 C<< ping >>

  my $res = $client->ping()->get;

Ping

Returns a L<< Speech::Recognition::Whisper::PingResponse >>.

=cut

1;
