output "instance_ip_addr" {
  value = google_compute_instance.instance-101.network_interface.0.access_config.0.network_interface
}

output "zones-splat" {
  description = "showing list of zones using the SPLAT expression"
  value = google_compute_instance.instance-101[*].zone
}

output "zones-for" {
  description = "showing the list of zones using the FOR expression in terraform"
  value = [for s in google_compute_instance.instance-101[*] : s.zone]
}

output "zone-by-server" {
  description = "showing the ouput for zones by server"
  value = [for s in google_compute_instance.instance-101[*]: "${s.name}: ${s.zone}"]
}

output "URL_0" {
  description = "URL of the first server"
  value = format("http://%s", google_compute_instance.instance-101[0].network_interface[0].access_config[0].ip)
}