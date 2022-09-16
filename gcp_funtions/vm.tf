resource "google_compute_instance" "default" {
  name         = "test-instance"
  machine_type = "e2-micro"
  zone         = "asia-northeast1-b"
  labels = {
    "env" = "dev"
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}
