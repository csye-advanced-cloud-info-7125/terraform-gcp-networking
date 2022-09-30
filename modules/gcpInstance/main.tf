# data "google_compute_subnetwork" "subnetsVal" {
#   name = var.subnets
# }

resource "google_compute_instance" "ubuntuvm" {
  name                      = "ubuntuvm"
  machine_type              = var.machine_type
  allow_stopping_for_update = true
  zone                      = var.zone

  boot_disk {
    initialize_params {
      image = var.image_id
      size  = 20
    }
  }

  network_interface {
    network    = var.vpc_name
    subnetwork = var.subnets
    access_config {}
  }

  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }

  service_account {
    email  = var.sa_email
    scopes = ["cloud-platform"]
  }

}
