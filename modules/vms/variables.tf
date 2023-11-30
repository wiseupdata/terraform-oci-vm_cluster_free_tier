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

variable "availability_domain" {}
variable "compartment_id" {}
variable "generate_ip" {}
variable "subnet" {}
variable "oci_ssh_authorized_key" {}

locals {
  image_id = data.oci_core_images.ubuntu_images.images[0].id
  # image_id = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaao27f22d7avekl642gfes2ijwezsuupwhtteh4wwyjwwgvyxzlzcq"
}