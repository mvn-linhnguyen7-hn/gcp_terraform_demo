resource "google_cloud_scheduler_job" "test_scheduler" {
  name        = "${var.project_id}-test"
  schedule    = "* * * * *"
  time_zone   = "Asia/Tokyo"

  pubsub_target {
    topic_name = google_pubsub_topic.test_function.id
    data       = base64encode("test!")
  }
}
