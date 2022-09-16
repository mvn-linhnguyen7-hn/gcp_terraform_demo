resource "google_pubsub_topic" "startVm_topic" {
  name = "start-instance-event"
}

resource "google_pubsub_topic" "stopVm_topic" {
  name = "stop-instance-event"
}
