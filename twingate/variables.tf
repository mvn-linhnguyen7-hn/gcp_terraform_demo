# variable "environment" {
#   type = string
# }

variable "project_id" {
  type = string
  default = "terraform-gcp-361801"
}

variable "region" {
  type = string
  default = "asia-northeast1"
}

variable "twingate_api_token" {
  type = string
  default = "B_QDkkT0PfNUV9Amw-lQqVMP_qarKmhwVMLaC89UokGSVpJ3B-tnNKKAyb_LURyK62rR5-752sVtSLmNjqGcxbEbupKE7ELp7zsHMSOjlpbChzLdhr25MDesIovqKQYxuIsMDQ"
}

variable "twingate_network" {
  type = string
  default = "lin0699"
}
