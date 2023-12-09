variable "project_id" {
  type = string
  description = "ID of the project to provision resources for"
}

variable "region" {
  type = string
  description = "Default Region"
  default = "us-central1"
}

variable "zone" {
  type = string
  description = "Default Zone"
  default = "us-central1-a"
}

variable "server_name" {
  type = string
  description = "Name of the server"
}

variable "machine_type" {
  type = string
  description = "Machine Type"
  default = "e2-micro"
}

variable "network" {
  description = ""
}

variable "subnets" {
  description = "value for the subnets"
}

variable "firewall" {
  description = "default definition for the firewall config."
}

variable "static_ip" {
  description = "static IP for connecting to Iowa On-prem"
  default = true
}