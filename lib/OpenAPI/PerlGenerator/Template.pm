package OpenAPI::PerlGenerator::Template 0.01;
use 5.020;
use experimental 'signatures';

our $info;

# Reflection package for template methods

sub map_type {
    $info->map_type( @_ );
}

sub openapi_submodules {
    $info->openapi_submodules( @_ );
}

sub openapi_response_content_types {
    $info->openapi_response_content_types( @_ );
}

sub openapi_http_code_match {
    $info->openapi_http_code_match( @_ );
}

sub render( $name, $args ) {
    $info->render( $name, $args );
}
*include = *include = \&render;

our %locations;
sub elsif_chain($id) {
    # Ignore all Mojo:: stuff!
    my $level = 0;
    if( !$locations{ $id }++) {
        return "if"
    #} elsif( $final ) {
    #    return " else "
    } else {
        return "} elsif"
    }
}

1;
