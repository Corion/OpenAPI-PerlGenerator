package OpenAPI::PerlGenerator::Template 0.02;
use 5.020;
use experimental 'signatures';

our $info;

=head1 NAME

OpenAPI::PerlGenerator::Template - Reflection package for template methods

=head1 DESCRIPTION

This package reflects functions called as subroutines onto a global
variable C<$info> for convenient calling from within (Mojolicious) templates.

=head1 REFLECTED METHODS

=head2 C<< markdown_to_pod >>

=cut

sub markdown_to_pod {
    $info->markdown_to_pod( @_ );
}

=head2 C<< map_type >>

=cut

sub map_type {
    $info->map_type( @_ );
}

=head2 C<< property_name >>

=cut

sub property_name {
    $info->property_name( @_ );
}

=head2 C<< single_line >>

=cut

sub single_line {
    $info->single_line( @_ );
}

=head2 C<< json_pretty >>

=cut

sub json_pretty {
    $info->json_pretty( @_ );
}

=head2 C<< perl_comment >>

=cut

sub perl_comment {
    $info->perl_comment( @_ );
}

=head2 C<< openapi_submodules >>

=cut

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

=head2 C<< resolve_schema >>

=cut

sub elsif_chain( $id ) {
    $info->elsif_chain( $id );
}

=head2 C<< resolve_schema >>

=cut

sub resolve_schema {
    $info->resolve_schema( @_ );
}

=head2 C<< class_type_name >>

=cut

sub class_type_name {
    $info->class_type_name( @_ );
}

=head2 C<< openapi_dependencies >>

=cut

sub openapi_dependencies {
    $info->openapi_dependencies( @_ );
}

=head2 C<< basename >>

=cut

sub basename {
    require File::Basename;
    return File::Basename::basename( @_ );
}

1;
__END__

=head1 REPOSITORY

The public repository of this module is
L<https://github.com/Corion/OpenAPI-PerlGenerator>.

=head1 SUPPORT

The public support forum of this module is L<https://perlmonks.org/>.

=head1 BUG TRACKER

Please report bugs in this module via the Github bug queue at
L<https://github.com/Corion/OpenAPI-PerlGenerator/issues>

=head1 AUTHOR

Max Maischein C<corion@cpan.org>

=head1 COPYRIGHT (c)

Copyright 2024- by Max Maischein C<corion@cpan.org>.

=head1 LICENSE

This module is released under the Artistic License 2.0.

=cut
