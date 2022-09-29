data "google_cloud_run_service" "default" {
  name     = "cloud_run"
  location = var.region
}

resource "google_cloud_run_service" "default" {
  name     = "cloudrun"
  location = var.region

  template {
    spec {
      containers {
        image = "gcr.io/terraform-gcp-361801/quickstart-image:tag1"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
  metadata {
    annotations = {
      "run.googleapis.com/ingress" = "internal-and-cloud-load-balancing"
    }
  }
}

resource "google_cloud_run_domain_mapping" "webapp" {
  location = var.region
  name     = "test.bomky.shop"

  metadata {
    namespace = var.project_id
  }

  spec {
    route_name = "cloudrun"
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.default.location
  project     = google_cloud_run_service.default.project
  service     = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}
