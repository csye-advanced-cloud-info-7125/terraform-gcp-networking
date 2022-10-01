variable "project_id" {
  type        = string
  description = "Provide the project id"
}
variable "region" {
  default     = "us-west1"
  type        = string
  description = "Provide the region"
}
variable "zone" {
  default     = "us-west1-a"
  type        = string
  description = "Provide the region"
}
variable "vpc_routing_mode" {
  default     = "REGIONAL"
  type        = string
  description = "pass routing mode"
}
variable "subnet_1_CIDR" {
  default     = "10.0.0.0/24"
  type        = string
  description = "Cidr value for first subnet"
}
variable "gce_ssh_username" {
  type        = string
  description = "Pass the user name"
}
variable "gce_ssh_pub_key_file" {
  type        = string
  description = "Pass the public key file path for SSH"
}
variable "gce_ssh_private_key_file" {
  type        = string
  description = "Pass the public key file path for SSH"
}

variable "service_account_credential_file" {
  type        = string
  description = "Pass the credential file for access"
}

variable "network" {
  default = "tf-vcp"
}

variable "machine_family" {
   default     = "n1-standard-2"
   type        = string
   description = "Provide the machine family"
}

variable "machine_image" {
   default     = "ubuntu-minimal-2204-jammy-v20220928"
   type        = string
   description = "Provide the machine image for boot"
}

