package AI::OpenAI::Client 0.01;
use 5.020;
use Moo 2;
use experimental 'signatures';

extends 'AI::OpenAI::Client::Impl';

=encoding utf8

=head1 NAME

AI::OpenAI::Client - Client for AI::OpenAI

=head1 SYNOPSIS

  use 5.020;
  use AI::OpenAI::Client;

  my $client = AI::OpenAI::Client->new(
      schema_file => '...',
      server => 'https://api.openai.com/v1',
  );
  my $res = $client->someMethod()->get;
  say $res;

=head1 METHODS

=head2 C<< listAssistants >>

  my $res = $client->listAssistants()->get;

Returns a list of assistants.

Returns a L<< AI::OpenAI::ListAssistantsResponse >> on success.

=cut

=head2 C<< createAssistant >>

  my $res = $client->createAssistant()->get;

Create an assistant with a model and instructions.

Returns a L<< AI::OpenAI::AssistantObject >> on success.

=cut

=head2 C<< deleteAssistant >>

  my $res = $client->deleteAssistant()->get;

Delete an assistant.

Returns a L<< AI::OpenAI::DeleteAssistantResponse >> on success.

=cut

=head2 C<< getAssistant >>

  my $res = $client->getAssistant()->get;

Retrieves an assistant.

Returns a L<< AI::OpenAI::AssistantObject >> on success.

=cut

=head2 C<< modifyAssistant >>

  my $res = $client->modifyAssistant()->get;

Modifies an assistant.

Returns a L<< AI::OpenAI::AssistantObject >> on success.

=cut

=head2 C<< createSpeech >>

  my $res = $client->createSpeech()->get;

Generates audio from the input text.

Returns a L<< string >> on success.

=cut

=head2 C<< createTranscription >>

  my $res = $client->createTranscription()->get;

Transcribes audio into the input language.

Returns Unknown on success.

=cut

=head2 C<< createTranslation >>

  my $res = $client->createTranslation()->get;

Translates audio into English.

Returns Unknown on success.

=cut

=head2 C<< listBatches >>

  my $res = $client->listBatches()->get;

List your organization's batches.

Returns a L<< AI::OpenAI::ListBatchesResponse >> on success.

=cut

=head2 C<< createBatch >>

  my $res = $client->createBatch()->get;

Creates and executes a batch from an uploaded file of requests

Returns a L<< AI::OpenAI::Batch >> on success.

=cut

=head2 C<< retrieveBatch >>

  my $res = $client->retrieveBatch()->get;

Retrieves a batch.

Returns a L<< AI::OpenAI::Batch >> on success.

=cut

=head2 C<< cancelBatch >>

  my $res = $client->cancelBatch()->get;

Cancels an in-progress batch.

Returns a L<< AI::OpenAI::Batch >> on success.

=cut

=head2 C<< createChatCompletion >>

  my $res = $client->createChatCompletion()->get;

Creates a model response for the given chat conversation.

Returns a L<< AI::OpenAI::CreateChatCompletionResponse >> on success.

=cut

=head2 C<< createCompletion >>

  my $res = $client->createCompletion()->get;

Creates a completion for the provided prompt and parameters.

Returns a L<< AI::OpenAI::CreateCompletionResponse >> on success.

=cut

=head2 C<< createEmbedding >>

  my $res = $client->createEmbedding()->get;

Creates an embedding vector representing the input text.

Returns a L<< AI::OpenAI::CreateEmbeddingResponse >> on success.

=cut

=head2 C<< listFiles >>

  my $res = $client->listFiles()->get;

Returns a list of files that belong to the user's organization.

Returns a L<< AI::OpenAI::ListFilesResponse >> on success.

=cut

=head2 C<< createFile >>

  my $res = $client->createFile()->get;

Upload a file that can be used across various endpoints. Individual files can be up to 512 MB, and the size of all files uploaded by one organization can be up to 100 GB.

The Assistants API supports files up to 2 million tokens and of specific file types. See the [Assistants Tools guide](/docs/assistants/tools) for details.

The Fine-tuning API only supports `.jsonl` files.

The Batch API only supports `.jsonl` files up to 100 MB in size.

Please [contact us](https://help.openai.com/) if you need to increase these storage limits.

Returns a L<< AI::OpenAI::OpenAIFile >> on success.

=cut

=head2 C<< deleteFile >>

  my $res = $client->deleteFile()->get;

Delete a file.

Returns a L<< AI::OpenAI::DeleteFileResponse >> on success.

=cut

=head2 C<< retrieveFile >>

  my $res = $client->retrieveFile()->get;

Returns information about a specific file.

Returns a L<< AI::OpenAI::OpenAIFile >> on success.

=cut

=head2 C<< downloadFile >>

  my $res = $client->downloadFile()->get;

Returns the contents of the specified file.

Returns a L<< string >> on success.

=cut

=head2 C<< listPaginatedFineTuningJobs >>

  my $res = $client->listPaginatedFineTuningJobs()->get;

List your organization's fine-tuning jobs

Returns a L<< AI::OpenAI::ListPaginatedFineTuningJobsResponse >> on success.

=cut

=head2 C<< createFineTuningJob >>

  my $res = $client->createFineTuningJob()->get;

Creates a fine-tuning job which begins the process of creating a new model from a given dataset.

Response includes details of the enqueued job including job status and the name of the fine-tuned models once complete.

[Learn more about fine-tuning](/docs/guides/fine-tuning)

Returns a L<< AI::OpenAI::FineTuningJob >> on success.

=cut

=head2 C<< retrieveFineTuningJob >>

  my $res = $client->retrieveFineTuningJob()->get;

Get info about a fine-tuning job.

[Learn more about fine-tuning](/docs/guides/fine-tuning)

Returns a L<< AI::OpenAI::FineTuningJob >> on success.

=cut

=head2 C<< cancelFineTuningJob >>

  my $res = $client->cancelFineTuningJob()->get;

Immediately cancel a fine-tune job.

Returns a L<< AI::OpenAI::FineTuningJob >> on success.

=cut

=head2 C<< listFineTuningJobCheckpoints >>

  my $res = $client->listFineTuningJobCheckpoints()->get;

List checkpoints for a fine-tuning job.

Returns a L<< AI::OpenAI::ListFineTuningJobCheckpointsResponse >> on success.

=cut

=head2 C<< listFineTuningEvents >>

  my $res = $client->listFineTuningEvents()->get;

Get status updates for a fine-tuning job.

Returns a L<< AI::OpenAI::ListFineTuningJobEventsResponse >> on success.

=cut

=head2 C<< createImageEdit >>

  my $res = $client->createImageEdit()->get;

Creates an edited or extended image given an original image and a prompt.

Returns a L<< AI::OpenAI::ImagesResponse >> on success.

=cut

=head2 C<< createImage >>

  my $res = $client->createImage()->get;

Creates an image given a prompt.

Returns a L<< AI::OpenAI::ImagesResponse >> on success.

=cut

=head2 C<< createImageVariation >>

  my $res = $client->createImageVariation()->get;

Creates a variation of a given image.

Returns a L<< AI::OpenAI::ImagesResponse >> on success.

=cut

=head2 C<< listModels >>

  my $res = $client->listModels()->get;

Lists the currently available models, and provides basic information about each one such as the owner and availability.

Returns a L<< AI::OpenAI::ListModelsResponse >> on success.

=cut

=head2 C<< deleteModel >>

  my $res = $client->deleteModel()->get;

Delete a fine-tuned model. You must have the Owner role in your organization to delete a model.

Returns a L<< AI::OpenAI::DeleteModelResponse >> on success.

=cut

=head2 C<< retrieveModel >>

  my $res = $client->retrieveModel()->get;

Retrieves a model instance, providing basic information about the model such as the owner and permissioning.

Returns a L<< AI::OpenAI::Model >> on success.

=cut

=head2 C<< createModeration >>

  my $res = $client->createModeration()->get;

Classifies if text is potentially harmful.

Returns a L<< AI::OpenAI::CreateModerationResponse >> on success.

=cut

=head2 C<< createThread >>

  my $res = $client->createThread()->get;

Create a thread.

Returns a L<< AI::OpenAI::ThreadObject >> on success.

=cut

=head2 C<< createThreadAndRun >>

  my $res = $client->createThreadAndRun()->get;

Create a thread and run it in one request.

Returns a L<< AI::OpenAI::RunObject >> on success.

=cut

=head2 C<< deleteThread >>

  my $res = $client->deleteThread()->get;

Delete a thread.

Returns a L<< AI::OpenAI::DeleteThreadResponse >> on success.

=cut

=head2 C<< getThread >>

  my $res = $client->getThread()->get;

Retrieves a thread.

Returns a L<< AI::OpenAI::ThreadObject >> on success.

=cut

=head2 C<< modifyThread >>

  my $res = $client->modifyThread()->get;

Modifies a thread.

Returns a L<< AI::OpenAI::ThreadObject >> on success.

=cut

=head2 C<< listMessages >>

  my $res = $client->listMessages()->get;

Returns a list of messages for a given thread.

Returns a L<< AI::OpenAI::ListMessagesResponse >> on success.

=cut

=head2 C<< createMessage >>

  my $res = $client->createMessage()->get;

Create a message.

Returns a L<< AI::OpenAI::MessageObject >> on success.

=cut

=head2 C<< deleteMessage >>

  my $res = $client->deleteMessage()->get;

Deletes a message.

Returns a L<< AI::OpenAI::DeleteMessageResponse >> on success.

=cut

=head2 C<< getMessage >>

  my $res = $client->getMessage()->get;

Retrieve a message.

Returns a L<< AI::OpenAI::MessageObject >> on success.

=cut

=head2 C<< modifyMessage >>

  my $res = $client->modifyMessage()->get;

Modifies a message.

Returns a L<< AI::OpenAI::MessageObject >> on success.

=cut

=head2 C<< listRuns >>

  my $res = $client->listRuns()->get;

Returns a list of runs belonging to a thread.

Returns a L<< AI::OpenAI::ListRunsResponse >> on success.

=cut

=head2 C<< createRun >>

  my $res = $client->createRun()->get;

Create a run.

Returns a L<< AI::OpenAI::RunObject >> on success.

=cut

=head2 C<< getRun >>

  my $res = $client->getRun()->get;

Retrieves a run.

Returns a L<< AI::OpenAI::RunObject >> on success.

=cut

=head2 C<< modifyRun >>

  my $res = $client->modifyRun()->get;

Modifies a run.

Returns a L<< AI::OpenAI::RunObject >> on success.

=cut

=head2 C<< cancelRun >>

  my $res = $client->cancelRun()->get;

Cancels a run that is `in_progress`.

Returns a L<< AI::OpenAI::RunObject >> on success.

=cut

=head2 C<< listRunSteps >>

  my $res = $client->listRunSteps()->get;

Returns a list of run steps belonging to a run.

Returns a L<< AI::OpenAI::ListRunStepsResponse >> on success.

=cut

=head2 C<< getRunStep >>

  my $res = $client->getRunStep()->get;

Retrieves a run step.

Returns a L<< AI::OpenAI::RunStepObject >> on success.

=cut

=head2 C<< submitToolOuputsToRun >>

  my $res = $client->submitToolOuputsToRun()->get;

When a run has the `status: "requires_action"` and `required_action.type` is `submit_tool_outputs`, this endpoint can be used to submit the outputs from the tool calls once they're all completed. All outputs must be submitted in a single request.

Returns a L<< AI::OpenAI::RunObject >> on success.

=cut

=head2 C<< listVectorStores >>

  my $res = $client->listVectorStores()->get;

Returns a list of vector stores.

Returns a L<< AI::OpenAI::ListVectorStoresResponse >> on success.

=cut

=head2 C<< createVectorStore >>

  my $res = $client->createVectorStore()->get;

Create a vector store.

Returns a L<< AI::OpenAI::VectorStoreObject >> on success.

=cut

=head2 C<< deleteVectorStore >>

  my $res = $client->deleteVectorStore()->get;

Delete a vector store.

Returns a L<< AI::OpenAI::DeleteVectorStoreResponse >> on success.

=cut

=head2 C<< getVectorStore >>

  my $res = $client->getVectorStore()->get;

Retrieves a vector store.

Returns a L<< AI::OpenAI::VectorStoreObject >> on success.

=cut

=head2 C<< modifyVectorStore >>

  my $res = $client->modifyVectorStore()->get;

Modifies a vector store.

Returns a L<< AI::OpenAI::VectorStoreObject >> on success.

=cut

=head2 C<< createVectorStoreFileBatch >>

  my $res = $client->createVectorStoreFileBatch()->get;

Create a vector store file batch.

Returns a L<< AI::OpenAI::VectorStoreFileBatchObject >> on success.

=cut

=head2 C<< getVectorStoreFileBatch >>

  my $res = $client->getVectorStoreFileBatch()->get;

Retrieves a vector store file batch.

Returns a L<< AI::OpenAI::VectorStoreFileBatchObject >> on success.

=cut

=head2 C<< cancelVectorStoreFileBatch >>

  my $res = $client->cancelVectorStoreFileBatch()->get;

Cancel a vector store file batch. This attempts to cancel the processing of files in this batch as soon as possible.

Returns a L<< AI::OpenAI::VectorStoreFileBatchObject >> on success.

=cut

=head2 C<< listFilesInVectorStoreBatch >>

  my $res = $client->listFilesInVectorStoreBatch()->get;

Returns a list of vector store files in a batch.

Returns a L<< AI::OpenAI::ListVectorStoreFilesResponse >> on success.

=cut

=head2 C<< listVectorStoreFiles >>

  my $res = $client->listVectorStoreFiles()->get;

Returns a list of vector store files.

Returns a L<< AI::OpenAI::ListVectorStoreFilesResponse >> on success.

=cut

=head2 C<< createVectorStoreFile >>

  my $res = $client->createVectorStoreFile()->get;

Create a vector store file by attaching a [File](/docs/api-reference/files) to a [vector store](/docs/api-reference/vector-stores/object).

Returns a L<< AI::OpenAI::VectorStoreFileObject >> on success.

=cut

=head2 C<< deleteVectorStoreFile >>

  my $res = $client->deleteVectorStoreFile()->get;

Delete a vector store file. This will remove the file from the vector store but the file itself will not be deleted. To delete the file, use the [delete file](/docs/api-reference/files/delete) endpoint.

Returns a L<< AI::OpenAI::DeleteVectorStoreFileResponse >> on success.

=cut

=head2 C<< getVectorStoreFile >>

  my $res = $client->getVectorStoreFile()->get;

Retrieves a vector store file.

Returns a L<< AI::OpenAI::VectorStoreFileObject >> on success.

=cut

1;
