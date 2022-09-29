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