variable "app_name" {
  type = string
}

variable "env" {
}

variable "vcn" {
  type = map(string)
  default = {
    label                    = "etldf"
    internet_gateway_enabled = "true"
    availability_domain      = "1"
    cidr                     = "30.0.0.0/16"
  }
}

variable "subnets" {
  type = map(any)
  default = {
    sub1 = {
      cidr    = "30.0.10.0/24"
      adIndex = 0
      label   = "1"
    }
  }
}

variable "compartment_id" {}
variable "tenancy_ocid" {}
variable "availability_domain" {}