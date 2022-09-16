resource "google_cloudfunctions_function" "startVm_function" {
  name        = "startInstancePubSub"
  region      = var.region

  runtime               = "nodejs10"
  available_memory_mb   = 256
  source_archive_bucket = google_storage_bucket.functions_source_bucket.name
  source_archive_object = google_storage_bucket_object.startVm_function_source.name

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = google_pubsub_topic.startVm_topic.name
  }

  max_instances = 1
  entry_point   = "startInstancePubSub"
}

resource "google_cloudfunctions_function" "stopVm_function" {
  name        = "stopInstancePubSub"
  region      = var.region

  runtime               = "nodejs10"
  available_memory_mb   = 256
  source_archive_bucket = google_storage_bucket.functions_source_bucket.name
  source_archive_object = google_storage_bucket_object.stopVm_function_source.name

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = google_pubsub_topic.stopVm_topic.name
  }

  max_instances = 1
  entry_point   = "stopInstancePubSub"
}
