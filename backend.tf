terraform {
  backend "gcs" {
    bucket  = "terraform-backend-project"
    prefix  = "terraform/state"
  }
}
