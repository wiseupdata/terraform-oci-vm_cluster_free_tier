output "subnet_public" {
  value = oci_core_subnet.this["sub1"].id
}
