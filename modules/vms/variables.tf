variable "image_name" {
  default = "ubuntu"
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
