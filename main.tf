resource "oci_identity_compartment" "this" {

  # Only create the resource group if no compartment id is specified by the user
  count = var.compartment_id != "auto-create" ? 0 : 1

  compartment_id = var.tenancy_ocid
  description    = "Compartment for the resources"
  name           = local.compartment_name

  freeform_tags = local.basic_tags
}

module "network" {
  source              = "./modules/network"
  app_name            = var.app_name
  compartment_id      = var.compartment_id != "auto-create" ? var.compartment_id : oci_identity_compartment.this[0].id
  env                 = var.env
  tenancy_ocid        = var.tenancy_ocid
  availability_domain = local.domain_ad
}

module "vms" {
  source                 = "./modules/vms"
  subnet                 = module.network.subnet_public
  availability_domain    = local.domain_ad
  compartment_id         = var.compartment_id != "auto-create" ? var.compartment_id : oci_identity_compartment.this[0].id
  generate_ip            = true
  oci_ssh_authorized_key = var.oci_ssh_authorized_key
}