variable "gcp_project" {
  default     = "cyse-group5"
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
  default     = "GLOBAL"
  type        = string
  description = "pass routing mode"
}
variable "subnet_1_CIDR" {
  default     = "10.0.0.0/16"
  type        = string
  description = "Cidr value for first subnet"
}
variable "gce_ssh_user" {
  default     = "rathore.v"
  type        = string
  description = "Pass the user name"
}
variable "gce_ssh_pub_key_file" {

}
variable "network" {
  default = "tf-vcp"
}
