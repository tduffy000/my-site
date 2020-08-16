output "site_bucket_name" {
  value = module.static-site-bucket.bucket_name
}

output "site_bucket_location" {
  value = module.static-site-bucket.bucket_location
}

output "site_bucket_self_link" {
  value = module.static-site-bucket.bucket_self_link
}

output "site_bucket_url" {
  value = module.static-site-bucket.bucket_url
}

output "https_proxy_id" {
  value = module.https_lb_to_backend_bucket.https_proxy_id
}

output "https_proxy_proxy_id" {
  value = module.https_lb_to_backend_bucket.https_proxy_proxy_id
}

output "https_proxy_self_link" {
  value = module.https_lb_to_backend_bucket.https_proxy_self_link
}

output "url_map_id" {
  value = module.https_lb_to_backend_bucket.url_map_id
}

output "url_map_map_id" {
  value = module.https_lb_to_backend_bucket.url_map_map_id
}

output "url_map_self_link" {
  value = module.https_lb_to_backend_bucket.url_map_self_link
}

output "bucket_backend_id" {
  value = module.https_lb_to_backend_bucket.bucket_backend_id
}

output "bucket_backend_self_link" {
  value = module.https_lb_to_backend_bucket.bucket_backend_self_link
}

output "https_global_forwarding_rule_id" {
  value = module.https_lb_to_backend_bucket.https_global_forwarding_rule_id
}

output "https_global_forwarding_rule_self_link" {
  value = module.https_lb_to_backend_bucket.https_global_forwarding_rule_self_link
}

output "www_static_external_ip_address" {
  value = module.https_lb_to_backend_bucket.www_static_external_ip_address
}

output "root_static_external_ip_address" {
  value = module.https_lb_to_backend_bucket.root_static_external_ip_address
}

output "dns_managed_zone_id" {
  value = module.dns.dns_managed_zone_id
}

