terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0.0"
    }
  }
}


provider "google" {
  credentials = var.service_account_credential_file
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}