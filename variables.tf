########################################
# Optional 
########################################
# Get automatic from the TF_VARs
variable "tenancy_ocid" {
}

########################################
# Optional 
########################################

variable "oci_ssh_authorized_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "company_name" {
  description = "The name of the company."
  type        = string
  default     = "wiseupdata"
}

variable "app_name" {
  description = "The name of the application"
  type        = string
  default     = "vms"
}

variable "compartment_id" {
  description = "The OCID of the compartment where the resources will be created. You can find the compartment ID in the OCI Console by navigating to the compartment where you want to create the resources and copying the OCID from the compartment details page."
  type        = string
  default     = "auto-create"
}

variable "availability_domain" {
  description = "ad1, ad1 or ad3"
  type        = string
  default     = "ad1"

}

variable "env" {
  description = "System environment."
  type        = string
  default     = "dev"
}

variable "default_tags" {
  description = "Default tags for all resources"
  type        = map(string)
  default = {
    "auto-create" = "true"
  }
}

locals {

  basic_tags = {
    "managed_by" : "terraform",
    "app_name" : var.app_name,
    "env" : var.env,
    "company" : var.company_name
  }

  compartment_name = "cp-${var.app_name}-${var.company_name}-${var.env}"

  domain_ad = [
    for ad in data.oci_identity_availability_domains.ADs.availability_domains : ad.name
    if can(regex(var.availability_domain, lower(replace(ad.name, "/[^a-zA-Z0-9]/", ""))))
  ][0]
}