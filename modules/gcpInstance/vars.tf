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
variable "vpc_name" {
  default = "tf-vcp"
}
variable "subnet_name" {
  default = "tf-vcp-subnetwork-us-east1"
  type    = string
}
variable "gce_ssh_user" {
  default     = "veer1"
  type        = string
  description = "Pass the user name"
}
variable "gce_ssh_pub_key_file" {
  default = "/Users/virendra/Desktop/gcpsshkey/gcpkey.pub"
}
variable "image_id" {
  default = "ubuntu-minimal-2204-jammy-v20220928"
}
variable "machine_type" {
  default = "n1-standard-2"
}
variable "sa_email" {
  default = "mainprojectiam@cyse-group5.iam.gserviceaccount.com"
}
variable "gcp_project" {
  default     = "cyse-group5"
  type        = string
  description = "Provide the project id"
}
variable "subnets" {
  type        = string
  description = "(optional) describe your variable"
}
