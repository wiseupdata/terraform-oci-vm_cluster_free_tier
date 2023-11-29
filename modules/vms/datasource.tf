data "oci_artifacts_container_images" "this" {
  compartment_id = var.compartment_id
  display_name = var.image_name
}