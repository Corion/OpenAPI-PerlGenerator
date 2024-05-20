package AI::OpenAPI::CompletionUsage 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

=head1 NAME

AI::OpenAPI::CompletionUsage -

=head1 SYNOPSIS

  my $obj = AI::OpenAPI::CompletionUsage->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< completion_tokens >>

Number of tokens in the generated completion.

=cut

has 'completion_tokens' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< prompt_tokens >>

Number of tokens in the prompt.

=cut

has 'prompt_tokens' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);

=head2 C<< total_tokens >>

Total number of tokens used in the request (prompt + completion).

=cut

has 'total_tokens' => (
    is       => 'ro',
    isa      => Int,
    required => 1,
);


1;