resource "google_cloudfunctions_function" "test_function" {
  name        = "${var.project_id}-test-function"
  region      = var.region

  runtime               = "nodejs16"
  available_memory_mb   = 256
  source_archive_bucket = google_storage_bucket.cloud_functions_source.name
  source_archive_object = google_storage_bucket_object.test_function_source.name

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = google_pubsub_topic.test_function.name
  }

  max_instances = 1
  entry_point   = "helloWorld"

  environment_variables = {
    BUCKET_NAME = google_storage_bucket.cloud_functions_source.name
    PROJECT_ID  = var.project_id
  }
}