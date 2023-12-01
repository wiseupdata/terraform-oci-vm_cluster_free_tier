## Set the varibles with TF_Var for example:
```
export TF_VAR_tenancy_ocid="ocid1.tenancy.oc1..aaaaaaaa1111111111111"
export TF_VAR_user_ocid="ocid1.user.oc1..aaaaaaaaa1111111"
export TF_VAR_fingerprint="a5:fd:ec:9c:31c"
export TF_VAR_region="eu-frankfurt-1"
export TF_VAR_private_key_path="/home/wiseupdata/.oci/oci_api_key.pem"
```

## Simple config. ❤️

main.tf
```
module "vm_cluster_free_tier" {
  source       = "wiseupdata/vm_cluster_free_tier/oci"
  version      = "0.0.1"
  tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaa11111111111111111111"
}
```

---

Check the result🏅

```bash
# Ensure pb is security
sudo chmod 600 ~/.ssh/id_rsa.pub

#Connect to your new VM using the public ip from the output
ssh -i ~/.ssh/id_rsa ubuntu@111.11.11.111
```