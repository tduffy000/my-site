variable "bucket_name" {}

variable "bucket_location" {}

variable "main_page_suffix" {}

variable "not_found_page" {}

variable "cors_origin" {
  type = list(string)
}

variable "cors_max_age" {}