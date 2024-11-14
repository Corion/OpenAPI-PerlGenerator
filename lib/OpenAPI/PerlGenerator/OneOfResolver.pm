package OpenAPI::PerlGenerator::OneOfResolver 0.02;
use 5.020;
use Moo 2;
use Carp 'croak';
use experimental 'signatures'; # actually, they are stable but stable.pm doesn't know
use stable 'postderef';
use Storable 'dclone';

sub collect( $elt, $rollup = [] ) {
    # Roll up
    # oneOf:
    #    - oneOf:
    #        - foo
    #        - bar
    #    - baz
    # into
    # oneOf:
    #     - foo
    #     - bar
    #     - baz
    my $curr = $elt->{oneOf};
    for my $e ($curr->@*) {
        if( exists $e->{oneOf}) {
            collect( $e, $rollup );
        } else {
            push $rollup->@*, $e;
        }
    };

    return $rollup;
};

# Find the path/value(s) that partition the set of $items->@* the best
sub most_partitioning( $paths, $items ) {
    # count($paths) for $items->@*
}

sub find_criteria( $class, $_elt ) {
    my $elt = collect( $_elt );

    # Now, roll up all required fields into their actual types
    # and then decide whether these types are different enough:
    # { path => 'foo/bar/baz', type => '...', value(s) => '...' }

    # build table of most-covering/partitioning paths, with count of values

    my %seen;
    use Data::Dumper;
    my @required = sort { $b->[1]->{required}->@* <=> $a->[1]->{required}->@* || $b->[0] cmp $a->[0] }
    map {
        my $t = $_;
        my $key;
        if( ref $t ne 'HASH' ) {
            croak "$t is not a hash: ".Dumper $t;
        } elsif( exists $t->{required}) {
            $key = join ";", sort $t->{required}->@*;
            if( $seen{ $key } ) {
                use Data::Dumper;
                warn Dumper [$seen{$key}, $t];
                croak "Can't decide for $key";
            } else {
                $seen{ $key } = $t;
            };
        } else {
            croak "Thing has no 'required' key: ". Dumper $t;
        };
        [ $key => $t ],
    } $elt->@*;

    # Now, generate code (or data?) to decide between the elements
    warn $_->[0] for @required;
    croak "Stopped";
    # We already know that
};

1;
