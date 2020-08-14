module "static-site-bucket" {
  source = "./storage_bucket"

  bucket_name      = local.bucket_name
  bucket_location  = local.bucket_location
  main_page_suffix = local.main_page_suffix
  not_found_page   = local.not_found_page
  cors_origin      = local.cors_origin
  cors_max_age     = local.cors_max_age
}

module "https_lb_to_backend_bucket" {
  source = "./load_balancer"

  bucket_name = local.bucket_name
}

module "dns" {
  source = "./dns"

  dns_name   = local.dns_name
  visibility = local.dns_visibility
  target_ips = [
    module.https_lb_to_backend_bucket.https_global_forwarding_rule_ip_address,
  ]
  ttl = 300
}