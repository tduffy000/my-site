https://github.com/gruntwork-io/terraform-google-static-assets/tree/v0.0.1/modules/cloud-storage-static-website

module "static-site-bucket" {
  source = "./storage_bucket"

  bucket_name      = local.bucket_name
  bucket_location  = local.bucket_location
  main_page_suffix = local.main_page_suffix
  not_found_page   = local.not_found_page
  cors_origin      = local.cors_origin
  cors_max_age     = local.cors_max_age
}