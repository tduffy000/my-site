provider "google" {
  credentials = file("account.json")
  project     = local.project_id
  region      = local.region
}
