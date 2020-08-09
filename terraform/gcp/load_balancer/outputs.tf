output "http_proxy_id" {
  value = google_compute_target_http_proxy.main.id
}

output "http_proxy_proxy_id" {
  value = google_compute_target_http_proxy.main.proxy_id
}

output "http_proxy_self_link" {
  value = google_compute_target_http_proxy.main.self_link
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

output "http_global_forwarding_rule_id" {
  value = google_compute_global_forwarding_rule.http.id
}

output "http_global_forwarding_rule_ip_address" {
  value = google_compute_global_forwarding_rule.http.ip_address
}

output "http_global_forwarding_rule_self_link" {
  value = google_compute_global_forwarding_rule.http.self_link
}