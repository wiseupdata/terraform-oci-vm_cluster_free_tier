resource "oci_core_instance" "vms" {

  for_each = var.vms

  availability_domain = local.domain_ad
  compartment_id      = var.compartment_id != "auto-create" ? var.compartment_id : oci_identity_compartment.this[0].id
  display_name        = each.key
  shape               = each.value["shape"]

  source_details {
    source_type             = "image"
    source_id               = local.image_id
    boot_volume_size_in_gbs = each.value["storage"]
  }

  shape_config {
    memory_in_gbs = each.value["memory"]
    ocpus         = each.value["cpu"]
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.this["sub1"].id
    assign_public_ip = true
    display_name     = each.key
  }

  metadata = {
    ssh_authorized_keys = file(var.oci_ssh_authorized_key)
  }
}
