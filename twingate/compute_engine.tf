resource "google_service_account" "compute_sa" {
  account_id   = "test-compute"
  display_name = "Compute Service Account"
}

#This is Twingate Connector instance, it needs internet access and doesn't need for disk encryption, this should be safely ignored.
#tfsec:ignore:google-compute-vm-disk-encryption-customer-key - #tfsec:ignore:google-compute-no-public-ip
resource "google_compute_instance" "twingate_connector" {
  name         = "twingate-connector"
  machine_type = "e2-small"
  zone         = "asia-northeast1-b"

  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-89-lts"
    }
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_vtpm                 = true
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    # This container declaration format is not a public API and may change without notice
    # Use gcloud command-line tool or Google Cloud Console to create a new one and dump metadata if it breaks
    block-project-ssh-keys    = true
    gce-container-declaration = <<EOT
spec:
  containers:
    - image: twingate/connector:1
      name: twingate_connector
      securityContext:
        privileged: true
      env:
        - name: TENANT_URL
          value: "https://${var.twingate_network}.twingate.com/"
        - name: ACCESS_TOKEN
          value: "${twingate_connector_tokens.gcp_connector_tokens.access_token}"
        - name: REFRESH_TOKEN
          value: "${twingate_connector_tokens.gcp_connector_tokens.refresh_token}"
        - name: TWINGATE_LABEL_HOSTNAME
          value: "`hostname`"
      stdin: false
      tty: false
      volumeMounts: []
      restartPolicy: OnFailure
      volumes: []
EOT
    google-logging-enabled    = "true"
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.compute_sa.email
    scopes = ["cloud-platform"]
  }
}
