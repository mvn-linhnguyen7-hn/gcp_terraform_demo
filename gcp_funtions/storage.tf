resource "google_storage_bucket" "functions_source_bucket" {
  name                        = "${var.project_id}-functions-source"
  location                    = var.region
  uniform_bucket_level_access = true
}

data "archive_file" "startVm_function" {
  type        = "zip"
  source_dir  = "./functions/startInstancePubSub"
  output_path = "./functions/startInstancePubSub.zip"
}

resource "google_storage_bucket_object" "startVm_function_source" {
  name   = "startInstancePubSub.zip"
  bucket = google_storage_bucket.functions_source_bucket.name
  source = "./functions/startInstancePubSub.zip"
}

data "archive_file" "stopVm_function" {
  type        = "zip"
  source_dir  = "./functions/stopInstancePubSub"
  output_path = "./functions/stopInstancePubSub.zip"
}

resource "google_storage_bucket_object" "stopVm_function_source" {
  name   = "stopInstancePubSub.zip"
  bucket = google_storage_bucket.functions_source_bucket.name
  source = "./functions/stopInstancePubSub.zip"
}
