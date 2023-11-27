resource "oci_identity_compartment" "this" {

  # Only create the resource group if no compartment id is specified by the user
  count = var.compartment_id != "auto-create" ? 0 : 1

  # compartment_id = var.tenancy_ocid
  description    = "Compartment for the resources"
  name           = local.compartment_name

  freeform_tags = local.basic_tags
}