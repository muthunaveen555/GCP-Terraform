resource "google_storage_bucket" "bucket" {
  name    = var.bucket-name
  project = var.project-name
}
