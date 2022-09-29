resource "google_service_account" "common_functions_sa" {
  account_id   = "test-functions-service-account"
  display_name = "Cloud Functions Common Service Account"
}

resource "google_project_iam_custom_role" "common_functions_role" {
  role_id     = "functions"
  title       = "Common Functions Custom Role"
  description = "Custom Role for Cloud Functions Common Service Account"
  permissions = [
    "secretmanager.locations.get",
    "secretmanager.locations.list",
    "secretmanager.secrets.create",
    "secretmanager.secrets.delete",
    "secretmanager.secrets.get",
    "secretmanager.secrets.getIamPolicy",
    "secretmanager.secrets.list",
    "secretmanager.secrets.setIamPolicy",
    "secretmanager.secrets.update",
    "secretmanager.versions.access",
    "secretmanager.versions.add",
    "secretmanager.versions.destroy",
    "secretmanager.versions.disable",
    "secretmanager.versions.enable",
    "secretmanager.versions.get",
    "secretmanager.versions.list"
  ]
}

resource "google_project_iam_member" "common_functions_role" {
  project = var.project_id
  role    = google_project_iam_custom_role.common_functions_role.id
  member  = "serviceAccount:${google_service_account.common_functions_sa.email}"
}
