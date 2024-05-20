package AI::OpenAPI::ChatCompletionRequestMessageContentPartImage 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

AI::OpenAPI::ChatCompletionRequestMessageContentPartImage -

=head1 SYNOPSIS

  my $obj = AI::OpenAPI::ChatCompletionRequestMessageContentPartImage->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< image_url >>

=cut

has 'image_url' => (
    is       => 'ro',
    isa      => HashRef,
    required => 1,
);

=head2 C<< type >>

The type of the content part.

=cut

has 'type' => (
    is       => 'ro',
    isa      => Enum[
        "image_url",
    ],
    required => 1,
);


1;
