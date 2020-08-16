resource "google_compute_backend_bucket" "site" {
  name        = "static-bucket"
  bucket_name = var.bucket_name
  enable_cdn  = false
}

resource "google_compute_global_address" "site" {
  name         = "site-external-address"
  ip_version   = "IPV4" # need one for IPV6?
  address_type = "EXTERNAL"
}

/** ROOT */
resource "google_compute_managed_ssl_certificate" "main" {
  provider = google-beta

  name = "site-ssl-cert"

  managed {
    domains = ["thomasduffy.io."]
  }
}

resource "google_compute_target_https_proxy" "main" {
  name             = "my-site-https-proxy"
  url_map          = google_compute_url_map.bucket.id
  ssl_certificates = [google_compute_managed_ssl_certificate.main.id]
}

resource "google_compute_url_map" "bucket" {
  name            = "static-bucket-url-map"
  default_service = google_compute_backend_bucket.site.id

  host_rule {
    hosts        = ["thomasduffy.io"]
    path_matcher = "static-bucket"
  }

  path_matcher {
    name            = "static-bucket"
    default_service = google_compute_backend_bucket.site.id

    path_rule {
      paths   = ["/"]
      service = google_compute_backend_bucket.site.id
    }
  }
}

resource "google_compute_global_forwarding_rule" "https" {
  name       = "https-rule"
  target     = google_compute_target_https_proxy.main.id
  port_range = 443
}

/** WWW */
resource "google_compute_managed_ssl_certificate" "www" {
  provider = google-beta

  name = "site-www-ssl-cert"

  managed {
    domains = ["www.thomasduffy.io."]
  }
}

resource "google_compute_target_https_proxy" "www" {
  name             = "my-site-www-https-proxy"
  url_map          = google_compute_url_map.bucket.id
  ssl_certificates = [google_compute_managed_ssl_certificate.www.id]
}

resource "google_compute_global_forwarding_rule" "www-https" {
  name       = "www-https-rule"
  target     = google_compute_target_https_proxy.www.id
  port_range = 443
  ip_address = google_compute_global_address.site.address
}

/** HTTP(S) Redirect*/
resource "google_compute_url_map" "redirect" {
  name = "http-redirect-url-map"
  default_url_redirect {
    https_redirect = true
    strip_query    = false
  }
}

resource "google_compute_target_http_proxy" "www" {
  name    = "my-site-www-http-proxy"
  url_map = google_compute_url_map.redirect.id
}

resource "google_compute_global_forwarding_rule" "www-http" {
  name       = "www-http-rule"
  target     = google_compute_target_http_proxy.www.id
  port_range = 80
  ip_address = google_compute_global_address.site.address
}

