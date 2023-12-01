data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.tenancy_ocid
}

# data "oci_core_images" "ubuntu_images" {
#   compartment_id = var.compartment_id
#   display_name   = var.image_name
# }
