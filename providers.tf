terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0.0"
    }
  }
}


provider "google" {
  credentials = file("./mainprojectIam.json")
  project     = var.gcp_project
  region      = var.region
  zone        = var.zone
}

