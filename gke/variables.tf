variable "project_id" {
  description = "The project ID to host the cluster in"
  default = "terraform-gcp-361801"
}
variable "cluster_name" {
  description = "The name for the GKE cluster"
  default     = "learnk8s-cluster"
}
variable "region" {
  description = "The region to host the cluster in"
  default = "europe-west1"
}
variable "network" {
  description = "The VPC network created to host the cluster in"
  default     = "gke-network"
}
variable "subnetwork" {
  description = "The subnetwork created to host the cluster in"
  default     = "gke-subnet"
}
variable "ip_range_pods_name" {
  description = "The secondary ip range to use for pods"
  default     = "ip-range-pods"
}
variable "ip_range_services_name" {
  description = "The secondary ip range to use for services"
  default     = "ip-range-services"
}
