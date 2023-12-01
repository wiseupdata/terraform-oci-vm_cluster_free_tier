output "subnet_public" {
  value = oci_core_subnet.this["sub1"].id
}

output "ip_masters" {
  value = oci_core_instance.vms["master-oci"].public_ip
}

output "ip_nodes" {
  value = oci_core_instance.vms["node-oci"].public_ip
}
