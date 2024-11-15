#!perl
use Test2::V0 '-no_srand';
use OpenAPI::PerlGenerator;
use OpenAPI::PerlGenerator::Template::Mojo;
use JSON;

=head1 NAME

enum.t - test that incorrect enum values raise an error

=cut

my $api_file_json = 't/jira/jira.json';
open my $fh, '<', $api_file_json
    or die "Couldn't read '$api_file_json': $!";
my $schema = do { local $/;
    JSON->new()->decode( <$fh> );
};

my $gen = OpenAPI::PerlGenerator->new(
    templates => \%OpenAPI::PerlGenerator::Template::Mojo::template,
    tidy => 0,
    version => '999',
    schema => $schema,
    prefix => 'My::Example',
);

my ($type, $mapping) = $gen->resolve_schema(
    $schema->{components}->{schemas}->{CustomContextVariable}
);

is $type, 'oneOf', "It's a oneOf";
is $mapping, {
    'mapping' => {
        'user' => 'My::Example::UserContextVariable',
        'issue' => 'My::Example::IssueContextVariable',
        'json' => 'My::Example::JsonContextVariable'
    },
    'discriminator' => 'type'
}, "... and it has the expected structure";

done_testing;
