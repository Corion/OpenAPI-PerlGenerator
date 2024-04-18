package JIRA::API::JsonNode 0.01;
# DO NOT EDIT! This is an autogenerated file.
use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int Object ArrayRef);
use MooX::TypeTiny;

=head1 NAME

JIRA::API::JsonNode -

=head1 SYNOPSIS

  my $obj = JIRA::API::JsonNode->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< array >>

=cut

has 'array' => (
    is       => 'ro',
);

=head2 C<< bigDecimal >>

=cut

has 'bigDecimal' => (
    is       => 'ro',
);

=head2 C<< bigInteger >>

=cut

has 'bigInteger' => (
    is       => 'ro',
);

=head2 C<< bigIntegerValue >>

=cut

has 'bigIntegerValue' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< binary >>

=cut

has 'binary' => (
    is       => 'ro',
);

=head2 C<< binaryValue >>

=cut

has 'binaryValue' => (
    is       => 'ro',
    isa      => ArrayRef[Str],
);

=head2 C<< boolean >>

=cut

has 'boolean' => (
    is       => 'ro',
);

=head2 C<< booleanValue >>

=cut

has 'booleanValue' => (
    is       => 'ro',
);

=head2 C<< containerNode >>

=cut

has 'containerNode' => (
    is       => 'ro',
);

=head2 C<< decimalValue >>

=cut

has 'decimalValue' => (
    is       => 'ro',
    isa      => Num,
);

=head2 C<< double >>

=cut

has 'double' => (
    is       => 'ro',
);

=head2 C<< doubleValue >>

=cut

has 'doubleValue' => (
    is       => 'ro',
    isa      => Num,
);

=head2 C<< elements >>

=cut

has 'elements' => (
    is       => 'ro',
    isa      => Object,
);

=head2 C<< fieldNames >>

=cut

has 'fieldNames' => (
    is       => 'ro',
    isa      => Object,
);

=head2 C<< fields >>

=cut

has 'fields' => (
    is       => 'ro',
    isa      => Object,
);

=head2 C<< floatingPointNumber >>

=cut

has 'floatingPointNumber' => (
    is       => 'ro',
);

=head2 C<< int >>

=cut

has 'int' => (
    is       => 'ro',
);

=head2 C<< intValue >>

=cut

has 'intValue' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< integralNumber >>

=cut

has 'integralNumber' => (
    is       => 'ro',
);

=head2 C<< long >>

=cut

has 'long' => (
    is       => 'ro',
);

=head2 C<< longValue >>

=cut

has 'longValue' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< missingNode >>

=cut

has 'missingNode' => (
    is       => 'ro',
);

=head2 C<< null >>

=cut

has 'null' => (
    is       => 'ro',
);

=head2 C<< number >>

=cut

has 'number' => (
    is       => 'ro',
);

=head2 C<< numberType >>

=cut

has 'numberType' => (
    is       => 'ro',
    isa      => Enum[
        "INT",
        "LONG",
        "BIG_INTEGER",
        "FLOAT",
        "DOUBLE",
        "BIG_DECIMAL",
    ],
);

=head2 C<< numberValue >>

=cut

has 'numberValue' => (
    is       => 'ro',
    isa      => Num,
);

=head2 C<< object >>

=cut

has 'object' => (
    is       => 'ro',
);

=head2 C<< pojo >>

=cut

has 'pojo' => (
    is       => 'ro',
);

=head2 C<< textValue >>

=cut

has 'textValue' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< textual >>

=cut

has 'textual' => (
    is       => 'ro',
);

=head2 C<< valueAsBoolean >>

=cut

has 'valueAsBoolean' => (
    is       => 'ro',
);

=head2 C<< valueAsDouble >>

=cut

has 'valueAsDouble' => (
    is       => 'ro',
    isa      => Num,
);

=head2 C<< valueAsInt >>

=cut

has 'valueAsInt' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< valueAsLong >>

=cut

has 'valueAsLong' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< valueAsText >>

=cut

has 'valueAsText' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< valueNode >>

=cut

has 'valueNode' => (
    is       => 'ro',
);


1;
