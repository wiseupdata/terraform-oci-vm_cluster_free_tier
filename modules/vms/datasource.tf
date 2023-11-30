
data "oci_core_images" "ubuntu_images" {
  compartment_id = var.compartment_id
  display_name = var.image_name
}
