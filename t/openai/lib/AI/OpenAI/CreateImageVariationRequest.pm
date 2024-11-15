package AI::OpenAI::CreateImageVariationRequest 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

AI::OpenAI::CreateImageVariationRequest -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::CreateImageVariationRequest->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< image >>

The image to use as the basis for the variation(s). Must be a valid PNG file, less than 4MB, and square.

=cut

has 'image' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< model >>

The model to use for image generation. Only `dall-e-2` is supported at this time.

=cut

has 'model' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< n >>

The number of images to generate. Must be between 1 and 10. For `dall-e-3`, only `n=1` is supported.

=cut

has 'n' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< response_format >>

The format in which the generated images are returned. Must be one of `url` or `b64_json`. URLs are only valid for 60 minutes after the image has been generated.

=cut

has 'response_format' => (
    is       => 'ro',
    isa      => Enum[
        "url",
        "b64_json",
    ],
);

=head2 C<< size >>

The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.

=cut

has 'size' => (
    is       => 'ro',
    isa      => Enum[
        "256x256",
        "512x512",
        "1024x1024",
    ],
);

=head2 C<< user >>

A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).

=cut

has 'user' => (
    is       => 'ro',
    isa      => Str,
);


1;
