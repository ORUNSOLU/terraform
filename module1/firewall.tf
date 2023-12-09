resource "google_compute_firewall" "firewall" {
  count = length(var.firewall)
  network = google_compute_instance.instance-101.id
  name = "${google_compute_network.instance-101.name}-${var.firewall[count.index]["index"]}"
  direction = var.firewall[count.index]["direction"]

  allow {
    protocol = var.firewall[count.index]["allow"]["protocol"]
    ports = var.firewall[count.index]["allow"]["ports"]
  }
  
  source_ranges = var.firewall[count.index]["source_range"]
  target_tags = var.firewall[count.index]["target_tags"]
}