resource "google_dns_managed_zone" "site" {
  name       = "my-site"
  dns_name   = var.dns_name
  visibility = var.visibility
}

resource "google_dns_record_set" "all" {
  managed_zone = google_dns_managed_zone.site.name

  name    = "*.${google_dns_managed_zone.site.dns_name}"
  type    = "A"
  rrdatas = var.target_ips
  ttl     = var.ttl
}