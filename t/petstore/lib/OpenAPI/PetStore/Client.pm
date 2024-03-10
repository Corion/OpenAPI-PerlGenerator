package AI::Ollama::Client 0.01;
use 5.020;
use Moo 2;
use experimental 'signatures';

extends 'AI::Ollama::Client::Impl';

=head1 NAME

AI::Ollama::Client - Client for AI::Ollama

=head1 SYNOPSIS

  use 5.020;
  use AI::Ollama::Client;

  my $client = AI::Ollama::Client->new(
      server => 'https://petstore.swagger.io/v2',
  );
  my $res = $client->someMethod()->get;
  say $res;

=head1 METHODS

=head2 C<< findPets >>

  my $res = $client->findPets()->get;



Returns a L<< AI::Ollama:: >>.
Returns a L<< AI::Ollama::Error >>.

=cut

=head2 C<< addPet >>

  my $res = $client->addPet()->get;



Returns a L<< AI::Ollama::Pet >>.
Returns a L<< AI::Ollama::Error >>.

=cut

=head2 C<< deletePet >>

  my $res = $client->deletePet()->get;



Returns a L<< AI::Ollama::Error >>.

=cut

=head2 C<< find_pet_by_id >>

  my $res = $client->find_pet_by_id()->get;



Returns a L<< AI::Ollama::Pet >>.
Returns a L<< AI::Ollama::Error >>.

=cut

1;
