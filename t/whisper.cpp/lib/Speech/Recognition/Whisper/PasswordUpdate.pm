package Speech::Recognition::Whisper::PasswordUpdate 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use Types::Standard qw(Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< current_password >>

=cut

has 'current_password' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< new_password >>

=cut

has 'new_password' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


1;
