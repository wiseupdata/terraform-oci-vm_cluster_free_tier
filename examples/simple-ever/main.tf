module "vm_cluster_free_tier" {
  source       = "wiseupdata/vm_cluster_free_tier/oci"
  version      = "0.0.1"
  tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaa11111111111111111111"
}