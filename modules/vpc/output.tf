output "network" {
  value       = google_compute_network.vpc.name
  description = "The name of the VPC being created"
}
