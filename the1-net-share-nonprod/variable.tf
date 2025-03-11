# variable "project_id" {
#   description = "GCP Project ID"
#   type        = string
# }

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "project_name" {
  description = "Name of the GCP project"
  type        = string
}

variable "org_id" {
  description = "Organization ID"
  type        = string
}

variable "billing_account_id" {
  description = "Billing Account ID"
  type        = string
}

variable "folder_id" {
  description = "Folder ID"
  type        = string
  default     = null
}

variable "lien" {
  description = "Prevent accidental deletion"
  type        = bool
}

variable "activate_apis" {
  description = "List of APIs to enable"
  type        = list(string)
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "peer_network" {
  description = "peering vpc name"
  type        = string
}

variable "peer_project_id" {
  description = "peering project ID"
  type        = string
}

variable "peer_name" {
  description = "peering name"
  type        = string
}