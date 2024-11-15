package AI::OpenAI::Image 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=encoding utf8

=head1 NAME

AI::OpenAI::Image -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::Image->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< b64_json >>

The base64-encoded JSON of the generated image, if `response_format` is `b64_json`.

=cut

has 'b64_json' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< revised_prompt >>

The prompt that was used to generate the image, if there was any revision to the prompt.

=cut

has 'revised_prompt' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< url >>

The URL of the generated image, if `response_format` is `url` (default).

=cut

has 'url' => (
    is       => 'ro',
    isa      => Str,
);


1;
