resource "google_compute_instance" "firstvm" {
  name                      = "ubuntuvm"
  machine_type              = var.machine_family
  allow_stopping_for_update = true
  zone                      = var.zone

  boot_disk {
    initialize_params {
      image = var.machine_image
      size  = 20
    }
  }

  network_interface {
    network    = google_compute_network.vpc.name
    subnetwork = google_compute_subnetwork.subnet1.name
    
    access_config {
      # nat_ip = google_compute_address.static.address
    }
  }

  provisioner "file" {
    connection {
      host        = self.network_interface.0.access_config.0.nat_ip
      type        = "ssh"
      user        = var.gce_ssh_username
      timeout     = "500s"
      private_key = file(var.gce_ssh_private_key_file)
    }

    source      = "${path.module}/script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    connection {
      host        = self.network_interface.0.access_config.0.nat_ip
      type        = "ssh"
      user        = var.gce_ssh_username
      timeout     = "500s"
      private_key = file(var.gce_ssh_private_key_file)
    }

    inline = [
      "chmod +x /tmp/script.sh",
      "cd /tmp",
      "./script.sh"
    ]
  }


  metadata = {
    ssh-keys = "${var.gce_ssh_username}:${file(var.gce_ssh_pub_key_file)}"
  }


  # service_account {
  #   # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
  #   email  = "983718668443-compute@developer.gserviceaccount.com"
  #   scopes = ["cloud-platform"]
  # }

}

resource "google_compute_firewall" "firewall-vpc" {
  name    = "tf-firewall"
  network = google_compute_network.vpc.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "8080", "1000-9000"]
  }

  source_ranges = ["0.0.0.0/0"]
}
