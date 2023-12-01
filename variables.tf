########################################
# Optional 
########################################
# Get automatic from the TF_VARs
variable "tenancy_ocid" {
  description = "It's will be fetch automatic from the tfvars if not passed."
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
  description = "ad1, ad2 or ad3"
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


########################################
# Optional for VMs
########################################

variable "oci_ssh_authorized_key" {
  default     = "~/.ssh/id_rsa.pub"
  description = "It can be generate using the command: ssh-keygen"
}


variable "image_name" {
  default = "Canonical-Ubuntu-22.04-aarch64-2023.10.13-0"
}

variable "vms" {
  type = map(any)
  default = {
    master-oci = {
      shape   = "VM.Standard.A1.Flex"
      storage = "50"
      memory  = "4"
      cpu     = "1"
      label   = "1"
    }
    node-oci = {
      shape   = "VM.Standard.A1.Flex"
      storage = "50"
      memory  = "20"
      cpu     = "3"
      label   = "2"
    }
  }
}

########################################
# Optional for Networks
########################################

variable "vcn" {
  type = map(string)
  default = {
    label                    = "etl"
    internet_gateway_enabled = "true"
    cidr                     = "30.0.0.0/16"
  }
}

variable "subnets" {
  type = map(any)
  default = {
    sub1 = {
      cidr    = "30.0.10.0/24"
      adIndex = 0
      label   = "etl"
    }
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

  # image_id = data.oci_core_images.ubuntu_images.images[0].id
  image_id = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaao27f22d7avekl642gfes2ijwezsuupwhtteh4wwyjwwgvyxzlzcq"

}

