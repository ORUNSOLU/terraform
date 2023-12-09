// extracting information from resources already provisioned through GCP
data "google_compute_instance" "inst-101" {
  name = "cmp101"
}

output "ip-address" {
  value = format("IP address of exisitng server: %s", data.google_compute_instance.inst-101.network_interface[0].access_config[0].ip)
}