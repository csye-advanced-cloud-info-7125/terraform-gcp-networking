resource "google_compute_address" "static" {
  name = "ipv4-address"
}

resource "google_compute_network" "vpc" {
  name                    = var.network
  project                 = var.project_id
  routing_mode            = var.vpc_routing_mode
  auto_create_subnetworks = false
}

resource "google_compute_router" "vpc_router" {
  name    = "tf-router"
  project = var.project_id
  region  = var.region
  network = google_compute_network.vpc.name
}

resource "google_compute_subnetwork" "subnet1" {
  name                     = "${var.network}-subnetwork-${var.region}"
  ip_cidr_range            = var.subnet_1_CIDR
  region                   = var.region
  private_ip_google_access = true
  network                  = google_compute_network.vpc.name
  depends_on               = [google_compute_network.vpc]
}