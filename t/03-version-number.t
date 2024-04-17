#!perl
use Test2::V0 '-no_srand';

use OpenAPI::PerlGenerator;
use OpenAPI::PerlGenerator::Template::Mojo;
use File::Basename;
use Mojo::File 'curfile', 'path';
use YAML::PP;
use JSON::PP;

=head1 NAME

version-number.t - test setting of the version number

=cut

my $gen = OpenAPI::PerlGenerator->new(
    templates => \%OpenAPI::PerlGenerator::Template::Mojo::template,
    tidy => 0,
    version => '999',
);

my $api_file_yaml = 't/more-testcases/more-testcases.yaml';
my $schema = YAML::PP->new( boolean => 'JSON::PP' )->load_file( $api_file_yaml );
my @files = $gen->generate(
    schema => $schema,
    prefix => 'My::API',
);

for my $f (@files) {
    like $f->{source}, qr/package My::API::[\w:]+ 999;/, "Version is 999";
}

my @files = $gen->generate(
    schema => $schema,
    prefix => 'My::API',
    version => '998',
);

for my $f (@files) {
    like $f->{source}, qr/package My::API::[\w:]+ 998;/, "->generate version overrides constructor version";
}

done_testing;
