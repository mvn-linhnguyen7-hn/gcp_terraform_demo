resource "google_pubsub_topic" "test_function" {
  name = "${var.project_id}-test-topic"
}
