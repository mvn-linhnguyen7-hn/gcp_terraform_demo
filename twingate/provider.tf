terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.11.0"
    }
    twingate = {
      source  = "Twingate/twingate"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

provider "twingate" {
  api_token = var.twingate_api_token
  network   = var.twingate_network
}
