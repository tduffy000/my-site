output "bucket_name" {
  value = google_storage_bucket.static-site.name
}

output "bucket_location" {
  value = google_storage_bucket.static-site.location
}

output "bucket_self_link" {
  value = google_storage_bucket.static-site.self_link
}

output "bucket_url" {
  value = google_storage_bucket.static-site.url
}