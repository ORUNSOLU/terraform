terraform {
  // the version of terraform to use
  required_version = ">= 1.3.0, < 2.0.0"
  // the version of the Google-Cloud API hashicorp provider to use
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 4.40"
    }
  }
}

provider "google" {
  project = var.project_id
  region = var.region
  zone = var.zone
  credentials = "./terraform.json"
}