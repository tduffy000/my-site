variable "dns_name" {}
variable "visibility" {}
variable "target_ips" {
  type = list(string)
}
variable "ttl" {}