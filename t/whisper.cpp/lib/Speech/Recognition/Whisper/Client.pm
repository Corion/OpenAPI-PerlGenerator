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

=head2 C<< post_audio_api_v1_transcribe__post >>

  my $res = $client->post_audio_api_v1_transcribe__post()->get;

Post Audio

Returns a L<< Speech::Recognition::Whisper::Transcription >>.
Returns a L<< Speech::Recognition::Whisper::HTTPValidationError >>.

=cut

=head2 C<< create_user_api_v1_users__post >>

  my $res = $client->create_user_api_v1_users__post()->get;

Create User

Returns a L<< Speech::Recognition::Whisper::UserResponse >>.
Returns a L<< Speech::Recognition::Whisper::HTTPValidationError >>.

=cut

=head2 C<< get_user_token_api_v1_users_get_token_post >>

  my $res = $client->get_user_token_api_v1_users_get_token_post()->get;

Get User Token

Returns a L<< Speech::Recognition::Whisper::Response_Token >>.
Returns a L<< Speech::Recognition::Whisper::HTTPValidationError >>.

=cut

=head2 C<< read_user_api_v1_users__user_id___get >>

  my $res = $client->read_user_api_v1_users__user_id___get()->get;

Read User

Returns a L<< Speech::Recognition::Whisper::UserResponse >>.
Returns a L<< Speech::Recognition::Whisper::HTTPValidationError >>.

=cut

=head2 C<< delete_user_api_v1_users__user_id__delete_delete >>

  my $res = $client->delete_user_api_v1_users__user_id__delete_delete()->get;

Delete User

Returns a L<< Speech::Recognition::Whisper::UserDeletedResponse >>.
Returns a L<< Speech::Recognition::Whisper::HTTPValidationError >>.

=cut

=head2 C<< update_password_api_v1_users__user_id__update_password__put >>

  my $res = $client->update_password_api_v1_users__user_id__update_password__put()->get;

Update Password

Returns a L<< Speech::Recognition::Whisper::UserResponse >>.
Returns a L<< Speech::Recognition::Whisper::HTTPValidationError >>.

=cut

=head2 C<< ping_ping_get >>

  my $res = $client->ping_ping_get()->get;

Ping

Returns a L<< Speech::Recognition::Whisper::PingResponse >>.

=cut

1;
