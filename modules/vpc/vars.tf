variable "gcp_project" {
  default     = "cyse-group5"
  type        = string
  description = "Provide the project id"
}
variable "region" {
  default     = "us-east1"
  type        = string
  description = "Provide the region"
}
variable "zone" {
  default     = "us-east1-b"
  type        = string
  description = "Provide the region"
}
variable "vpc_routing_mode" {
  default     = "REGIONAL"
  type        = string
  description = "pass routing mode"
}
# variable "subnet_1_CIDR" {
#   default     = "10.0.0.0/24"
#   type        = string
#   description = "Cidr value for first subnet"
# }
variable "network" {
  default = "tf-vcp"
}

