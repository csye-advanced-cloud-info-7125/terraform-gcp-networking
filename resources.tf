resource "google_compute_network" "vpc" {
  name                    = var.network
  project                 = var.gcp_project
  routing_mode            = var.vpc_routing_mode
  auto_create_subnetworks = false
  # delete_default_routes_on_create = true
}


resource "google_compute_firewall" "firewall-vpc" {
  name    = "tf-firewall"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_router" "vpc_router" {
  name    = "tf-router"
  project = var.gcp_project
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

resource "google_compute_instance" "firstvm" {
  name                      = "ubuntuvm"
  machine_type              = "n2-standard-2"
  allow_stopping_for_update = true
  zone                      = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-arm64-v20220924"
    }
  }

  network_interface {
    network    = google_compute_network.vpc.name
    subnetwork = google_compute_subnetwork.subnet1.name
    access_config {}
  }

  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "mainprojectiam@cyse-group5.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }

}