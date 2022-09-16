resource "google_cloud_scheduler_job" "startVm_scheduler" {
  name        = "startup-dev-instances"
  schedule    = "30 8 * * 1-5"
  time_zone   = "Asia/Tokyo"

  pubsub_target {
    topic_name = google_pubsub_topic.startVm_topic.id
    data       = base64encode(jsonencode({"zone":"asia-northeast1-b", "label":"env=dev"}))
  }
}

resource "google_cloud_scheduler_job" "stopVm_scheduler" {
  name        = "shutdown-dev-instances"
  schedule    = "30 17 * * 1-5"
  time_zone   = "Asia/Tokyo"

  pubsub_target {
    topic_name = google_pubsub_topic.stopVm_topic.id
    data       = base64encode(jsonencode({"zone":"asia-northeast1-b", "label":"env=dev"}))
  }
}
