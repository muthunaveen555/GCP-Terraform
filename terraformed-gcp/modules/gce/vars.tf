variable "main-instance-name" {
  type = string
}
variable "main-machine-type" {
  type    = string
  default = "n1-standard-1"
}
variable "main-zone" {
  type    = string
  default = "us-central1-a"
}
variable "project-name" {
  type = string
}
variable "main-instance-image" {
  type    = string
  default = "debian-cloud/debian-9"
}
variable "network-name" {
  type = string
}
variable "subnetwork-name" {
  type = string
}
