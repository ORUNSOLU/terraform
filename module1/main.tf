data "google_compute_zones" "available" {
  
}

locals {
  staging_var = "staging"
}

resource "google_compute_address" "static" {
  count = var.static_ip ? 1: 0
  name = "${var.server_name}-ipv4-address"
}

resource "google_compute_instance" "instance-101" {
  provider = google
  count = 3
  name = "${var.server_name}-${count.index}"
  machine_type = var.machine_type
  zone = data.google_compute_zones.available.name[count.index]
  self_link = "https://www.googleapis.com/compute/v1/projects/tf-gcp-01/regions/us-central1/subnetworks/iowa"
  # stack_type = "IPV4_ONLY"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Epheremal Public IP
    }
  }

  // add a startup script for the server
  metadata_startup_script = file("startup.sh")
  tags = [ "http-server" ]
  lifecycle {
    ignore_changes = [ labels, ]
  }
}

output "zones" {
  value = [for s in google_google_compute_instance.instance-101[*] : "${s.name}: ${s.zone}"]
}