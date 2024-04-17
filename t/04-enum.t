#!perl
use Test2::V0 '-no_srand';
use OpenAPI::PerlGenerator;
use OpenAPI::PerlGenerator::Template::Mojo;
use YAML::PP;

=head1 NAME

enum.t - test that incorrect enum values raise an error

=cut

my $gen = OpenAPI::PerlGenerator->new(
    templates => \%OpenAPI::PerlGenerator::Template::Mojo::template,
    tidy => 0,
    version => '999',
);

my $api_file_yaml = 't/ollama/ollama-curated.yaml';
my $schema = YAML::PP->new( boolean => 'JSON::PP' )->load_file( $api_file_yaml );
my @files = $gen->load_schema(
    schema => $schema,
    prefix => 'My::API',
);

eval {
    My::API::GenerateCompletionRequest->new(
      format => 'xjson'
    , model => 'test1',
    , prompt => 'ignore this',
    );
};
like $@, qr/Value "xjson" did not pass type constraint/, "Incorrect parameter value raises an error";

eval {
    My::API::GenerateCompletionRequest->new(
      format => 'json'
    , model => 'test1',
    , prompt => 'ignore this',
    );
};
is $@, "", "No error with correct parameter";

done_testing;
