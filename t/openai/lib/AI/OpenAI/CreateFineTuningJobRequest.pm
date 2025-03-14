package AI::OpenAI::CreateFineTuningJobRequest 0.01;
# DO NOT EDIT! This is an autogenerated file.

use 5.020;
use Moo 2;
use experimental 'signatures';
use stable 'postderef';
use Types::Standard qw(Enum Str Bool Num Int HashRef ArrayRef);
use MooX::TypeTiny;

use namespace::clean;

=encoding utf8

=head1 NAME

AI::OpenAI::CreateFineTuningJobRequest -

=head1 SYNOPSIS

  my $obj = AI::OpenAI::CreateFineTuningJobRequest->new();
  ...

=cut

sub as_hash( $self ) {
    return { $self->%* }
}

=head1 PROPERTIES

=head2 C<< hyperparameters >>

The hyperparameters used for the fine-tuning job.

=cut

has 'hyperparameters' => (
    is       => 'ro',
    isa      => HashRef,
);

=head2 C<< integrations >>

A list of integrations to enable for your fine-tuning job.

=cut

has 'integrations' => (
    is       => 'ro',
    isa      => ArrayRef[HashRef],
);

=head2 C<< model >>

The name of the model to fine-tune. You can select one of the
[supported models](/docs/guides/fine-tuning/what-models-can-be-fine-tuned).

=cut

has 'model' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< seed >>

The seed controls the reproducibility of the job. Passing in the same seed and job parameters should produce the same results, but may differ in rare cases.
If a seed is not specified, one will be generated for you.

=cut

has 'seed' => (
    is       => 'ro',
    isa      => Int,
);

=head2 C<< suffix >>

A string of up to 18 characters that will be added to your fine-tuned model name.

For example, a `suffix` of "custom-model-name" would produce a model name like `ft:gpt-3.5-turbo:openai:custom-model-name:7p4lURel`.

=cut

has 'suffix' => (
    is       => 'ro',
    isa      => Str,
);

=head2 C<< training_file >>

The ID of an uploaded file that contains training data.

See [upload file](/docs/api-reference/files/create) for how to upload a file.

Your dataset must be formatted as a JSONL file. Additionally, you must upload your file with the purpose `fine-tune`.

See the [fine-tuning guide](/docs/guides/fine-tuning) for more details.

=cut

has 'training_file' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

=head2 C<< validation_file >>

The ID of an uploaded file that contains validation data.

If you provide this file, the data is used to generate validation
metrics periodically during fine-tuning. These metrics can be viewed in
the fine-tuning results file.
The same data should not be present in both train and validation files.

Your dataset must be formatted as a JSONL file. You must upload your file with the purpose `fine-tune`.

See the [fine-tuning guide](/docs/guides/fine-tuning) for more details.

=cut

has 'validation_file' => (
    is       => 'ro',
    isa      => Str,
);


1;
