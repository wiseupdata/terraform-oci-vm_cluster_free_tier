
data "oci_core_images" "ubuntu_images" {
  compartment_id = var.compartment_id
  # shape = var.vms["master-oci"]["shape"]
  # operating_system_version = "22.04"
  # operating_system = "Ubuntu"
  # display_name = "Canonical-Ubuntu-22.04-aarch64-2023.10.13-0"

  # filter {
  #   name   = "display_name"
  #   values = ["Canonical Ubuntu 20.04%"]
  # }

}
