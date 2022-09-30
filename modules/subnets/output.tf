output "subnets" {
  value       = google_compute_subnetwork.subnet1.name
  description = "The created subnet resources"
}
