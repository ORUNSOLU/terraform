terraform {
  backend "gcs" {
    bucket = "qwiklabs-734872190218"
    prefix = "tfstate/backend"
  }
}