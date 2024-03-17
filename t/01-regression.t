#!perl
use Test2::V0 '-no_srand';

use OpenAPI::PerlGenerator;
use OpenAPI::PerlGenerator::Template::Mojo;
use File::Basename;
use Mojo::File 'curfile', 'path';
use YAML::PP;

use Getopt::Long;
GetOptions(
    'update|u' => \my $update,
);

=head1 NAME

regression.t - test regressions against known-good OpenAPI specs

=cut

my $gen = OpenAPI::PerlGenerator->new(
    templates => \%OpenAPI::PerlGenerator::Template::Mojo::template,
    tidy => 0,
);

my %prefix = (
    'ollama' => 'AI::Ollama',
    'petstore' => 'OpenAPI::PetStore',
    'more-testcases' => 'More::TestCases',
);

my @testcases = grep { -d } curfile()->dirname->list({ dir => 1 })->@*;
for my $known (@testcases) {
    (my $api_file) = grep { /\.yaml$/ } $known->list->@*;
    my $prefix = $prefix{ $known->basename };
    note "$prefix";
    my $schema = YAML::PP->new( boolean => 'JSON::PP' )->load_file( $api_file );
    my @files = $gen->generate(
        schema => $schema,
        prefix => "$prefix",
    );
        
    for my $f (@files) {
        # Check that all files exist and have the same content
        my $file = Mojo::File->new($known, $f->{filename});
        if( ok -f $file, "$file exists" ) {
        my $known_content = $file->slurp(':raw:UTF-8');
            is $f->{source}, $known_content, "The content has not changed";
        } else {
            SKIP: {
                skip 1, "File does not exist";
            };
        }
        if( $update ) {
            $file->spew( $f->{ source });
        }
    }
    
    note "$prefix";
}

done_testing;