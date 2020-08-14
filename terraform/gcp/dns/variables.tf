variable "dns_name" {}
variable "visibility" {}
variable "root_target_ips" {
  type = list(string)
}
variable "www_target_ips" {
  type = list(string)
}
variable "ttl" {}