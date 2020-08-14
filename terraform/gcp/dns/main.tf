resource "google_dns_managed_zone" "site" {
  name       = "my-site"
  dns_name   = var.dns_name
  visibility = var.visibility

  dnssec_config {
    state = "on"
  }
}

resource "google_dns_record_set" "root" {
  managed_zone = google_dns_managed_zone.site.name

  name    = var.dns_name
  type    = "A"
  rrdatas = var.target_ips
  ttl     = var.ttl
}

resource "google_dns_record_set" "www" {
  managed_zone = google_dns_managed_zone.site.name

  name    = "www.${google_dns_managed_zone.site.dns_name}"
  type    = "CNAME"
  rrdatas = [var.dns_name]
  ttl     = var.ttl
}