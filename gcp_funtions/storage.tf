data "archive_file" "test_function" {
  type        = "zip"
  source_dir  = "./functions/test_functions"
  output_path = "./functions/test_functions.zip"
}

resource "google_storage_bucket" "cloud_functions_source" {
  name                        = "${var.project_id}-test-functions-source"
  location                    = var.region
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "test_function_source" {
  name   = "${data.archive_file.test_function.output_md5}.zip"
  bucket = google_storage_bucket.cloud_functions_source.name
  source = "./functions/test_functions.zip"
}
