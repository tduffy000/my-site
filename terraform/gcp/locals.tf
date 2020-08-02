locals {
  region           = "US"
  bucket_name      = "thomasduffy.io"
  bucket_location  = "US"
  main_page_suffix = "index.html"
  not_found_page   = "404.html"
  cors_origin      = ["http://thomasduffy.io"]
  cors_max_age     = 3600
}