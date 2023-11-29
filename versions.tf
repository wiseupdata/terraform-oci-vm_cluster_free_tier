terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~>5.21"
    }
  }
}

provider "oci" {
}