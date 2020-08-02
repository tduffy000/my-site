/**
  * The GCP Storage Bucket
  */
resource "google_storage_bucket" "static-site" {

  name     = var.bucket_name
  location = var.bucket_location

  force_destroy      = true
  bucket_policy_only = true

  website {
    main_page_suffix = var.main_page_suffix
    not_found_page   = var.not_found_page
  }
  cors {
    origin          = var.cors_origin
    method          = ["GET"]
    response_header = ["*"]
    max_age_seconds = var.cors_max_age
  }
}

/**
  * IAM to make it publicly accessible
  */
data "google_iam_policy" "public" {
  binding {
    role = "roles/storage.objectViewer"
    members = [
      "allUsers",
    ]
  }
}

resource "google_storage_bucket_iam_policy" "public" {
  bucket      = google_storage_bucket.static-site.name
  policy_data = data.google_iam_policy.public.policy_data
}