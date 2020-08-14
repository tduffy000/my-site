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

resource "google_compute_backend_bucket" "site" {
  name        = "static-bucket"
  bucket_name = var.bucket_name
  enable_cdn  = false
}

resource "google_compute_global_forwarding_rule" "https" {
  name       = "https-rule"
  target     = google_compute_target_https_proxy.main.id
  port_range = 443
}
