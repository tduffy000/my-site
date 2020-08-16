output "https_proxy_id" {
  value = google_compute_target_https_proxy.main.id
}

output "https_proxy_proxy_id" {
  value = google_compute_target_https_proxy.main.proxy_id
}

output "https_proxy_self_link" {
  value = google_compute_target_https_proxy.main.self_link
}

output "url_map_id" {
  value = google_compute_url_map.bucket.id
}

output "url_map_map_id" {
  value = google_compute_url_map.bucket.map_id
}

output "url_map_self_link" {
  value = google_compute_url_map.bucket.self_link
}

output "bucket_backend_id" {
  value = google_compute_backend_bucket.site.id
}

output "bucket_backend_self_link" {
  value = google_compute_backend_bucket.site.self_link
}

output "https_global_forwarding_rule_id" {
  value = google_compute_global_forwarding_rule.https.id
}

output "https_global_forwarding_rule_ip_address" {
  value = google_compute_global_forwarding_rule.https.ip_address
}

output "https_global_forwarding_rule_self_link" {
  value = google_compute_global_forwarding_rule.https.self_link
}

output "www_https_global_forwarding_rule_ip_address" {
  value = google_compute_global_forwarding_rule.www-https.ip_address
}

output "static_external_ip_address_self_link" {
  value = google_compute_global_address.site.self_link
}

output "static_external_ip_address" {
  value = google_compute_global_address.site.address
}