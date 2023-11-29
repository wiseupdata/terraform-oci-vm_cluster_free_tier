Easy create a VM cluster!

--- 

<a href="https://github.com/wiseupdata/wiseupdata">
  <img align="left" alt="Wise Up Data's Instagram" width="22px" src="https://raw.githubusercontent.com/wiseupdata/wiseupdata/main/assets/instagram.png" />   
</a> 
<a href="https://github.com/wiseupdata/wiseupdata">
  <img align="left" alt="wise Up Data's Discord" width="22px" src="https://raw.githubusercontent.com/wiseupdata/wiseupdata/main/assets/discord.png" />
</a>
<a href="https://github.com/wiseupdata/wiseupdata">
  <img align="left" alt="wise Up Data | Twitter" width="22px" src="https://raw.githubusercontent.com/wiseupdata/wiseupdata/main/assets/twitter.png" />
</a>
<a href="https://github.com/wiseupdata/wiseupdata">
  <img align="left" alt="wise Up Data's LinkedIN" width="22px" src="https://raw.githubusercontent.com/wiseupdata/wiseupdata/main/assets/linkedin.png" />
</a>

![Visitors](https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2Fwiseupdata%2Fterraform-oci-cluster_vm&countColor=%2337d67a&style=flat)
![GitHub](https://img.shields.io/github/license/wiseupdata/terraform-oci-datalake)

---

<h1>
<img align="left" alt="img" src="https://raw.githubusercontent.com/wiseupdata/terraform-oci-datalake/main/assets/terraform.png" width="100" />

Module - Create a Data Lake / Delta Lake 🚀️

</h1>
Last version tested | Terraform 4.1 and oci 4.115

## Simple config. ❤️

main.tf
```
module "datalake" {
  source           = "wiseupdata/datalake/oci"
  version          = "0.0.1"
  bucket_namespace = var.bucket_namespace
  tenancy_ocid     = var.tenancy_ocid
}
```

## Features ✨️

- Auto-generated tags
- Auto-generated the compartment
- Apply's the Standard, environment as suffix
- Variables are optionals and can be overwrite with a custom value

## Create the resources🤜

```
terraform init
terraform fmt -recursive
terraform validate
terraform plan -out plan.output
terraform apply plan.output
```

Check the result🏅

---

<a href="https://github.com/wiseupdata/wiseupdata">
  <img align="center" alt="wise Up Data" width="90%" src="https://raw.githubusercontent.com/wiseupdata/terraform-oci-datalake/main/assets/result.gif" />
</a>

---

# Clean the resources 🏳

```
terraform destroy -auto-approve
```

## OCI credentials 🤜




<br>
<br>

# References🤘

1. [Wise Up Data - Github](https://github.com/wiseupdata)
1. [Set OCI tf_vars](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/terraformproviderconfiguration.htm)
1. [Find variables from OCI](https://www.youtube.com/watch?v=bWdV2w27dl0)
1. [Generate fingeprint](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm)
1. [OCI regions](https://docs.oracle.com/en-us/iaas/Content/General/Concepts/regions.htm)

```bash
mkdir ~/.oci
rm ~/.oci/oci_api_key.pem
openssl genrsa -out ~/.oci/oci_api_key.pem 2048
chmod go-rwx ~/.oci/oci_api_key.pem
cat ~/.oci/oci_api_key.pem

openssl rsa -pubout -in ~/.oci/oci_api_key.pem -out ~/.oci/oci_api_key_public.pem
cat ~/.oci/oci_api_key_public.pem
```

---

<br>


<br><br>
---

#### Maintainer 🤗 👨‍💻

Sivio Liborio

📧 silvio.liborio@wiseupdata.com

<a href="https://www.linkedin.com/in/silvio-de-melo-liborio">silvio-de-melo-liborio <img align="left" alt="LinkedIN" width="18px" src="https://raw.githubusercontent.com/wiseupdata/wsl-latest/main/assets/linkedin.svg" />
</a>
