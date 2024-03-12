package OpenAPI::PerlGenerator::Utils 0.01;
use 5.020;
use experimental 'signatures';

use Exporter 'import';
use Perl::Tidy;
use File::Basename;
use File::Path 'make_path';

our @EXPORT_OK = (qw(tidy update_file));

sub tidy( $source ) {
    my $formatted = $source;
    Perl::Tidy::perltidy(
        source      => \$source,
        destination => \$formatted,
        argv        => [ '--no-memoize' ],
    ) or $source = $formatted;
    return $formatted;
}

sub update_file( %options ) {
    my $filename = delete $options{ filename }
        or die "Need a filename to create/update";
    my $output_directory = delete $options{ output_directory } // '.';
    my $force = delete $options{ force };
    $filename = "$output_directory/$filename";
    my $new_content = delete $options{ content };
    my $keep_existing = $options{ keep_existing };
    my $encoding = $options{ encoding } // ':raw:encoding(UTF-8)';

    my $content;
    if( -f $filename ) {
        return if $keep_existing and not $force;

        open my $fh, "<$encoding", $filename
            or die "Couldn't read '$filename': $!";
        local $/;
        $content = <$fh>;
    };

    if( $content and $content ne $new_content ) {
        make_path( dirname $filename ); # just to be sure
        if( open my $fh, ">$encoding", $filename ) {
            print $fh $new_content;
        } else {
            warn "Couldn't (re)write '$filename': $!";
        };
    };
}

1;
