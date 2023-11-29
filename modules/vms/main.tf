resource "oci_core_instance" "vms" {

  for_each = var.vms

  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  display_name        = each.key
  shape               = each.value["shape"]

  source_details {
    source_type             = "image"
    source_id               = data.oci_artifacts_container_images.this.id
    boot_volume_size_in_gbs = each.value["storage"]
  }

  shape_config {
    memory_in_gbs = each.value["memory"]
    ocpus         = each.value["cpu"]
  }

  create_vnic_details {
    subnet_id        = var.subnet
    assign_public_ip = var.generate_ip
    display_name     = each.key
  }

  metadata = {
    ssh_authorized_keys = file(var.oci_ssh_authorized_key)
  }
}
