provider "google" {
  credentials = file("security.json")
  region = "us-east1"
  zone = "us-east1-b"
  project = "gcp-terraform-test101"
}

resource "google_compute_network" "vpc_network" {
  name                    = "my-custom-mode-network"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "default" {
  name          = "my-custom-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-east1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_instance" "default" {
  name = "Ontario-vm-101"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian"
    }
  }

  metadata = "sudo apt-get update; apt-get -y apache2; sudo apt-update"

  network_interface {
    network = "default"
    access_config {
      // Ephermeral IP
    }
  }
}