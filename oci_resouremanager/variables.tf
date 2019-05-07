variable "compartment_ocid" {
  type        = "string"
  default = "ocid1.compartment.oc1..aaaaaaaafhnpsjvntzgj3igqmxu4i5sd7mg42j3o3nfjvkehdukncp6f243q"
}

variable "tenancy_ocid" {
  type        = "string"
  default     = "ocid1.tenancy.oc1..aaaaaaaa6ma7kq3bsif76uzqidv22cajs3fpesgpqmmsgxihlbcemkklrsqa"
}

variable "ssh_public_key" {}

# general oci parameters

variable "disable_auto_retries" {
  default = true
}

variable "region" {
  description = "region"
  default     = "us-phoenix-1"
}

# DB System

variable "db_system_shape" {
  default = "VM.Standard2.1"
}

variable "db_edition" {
  default = "ENTERPRISE_EDITION"
}

variable "db_admin_password" {
  default = "WelCome_11##"
}
variable "db_name" {
  default = "demodb"
}

variable "character_set" {
  default = "AL32UTF8"
}
variable "db_workload" {
  default = "OLTP"
}

variable "pdb_name" {
  default = "pdb1"
}

variable "db_version" {
#  default = "12.2.0.1"
  default = "12.2.0.1.190115"
}

variable "db_home_display_name" {
  default = "DemoDB"
}

variable "db_system_display_name" {
  default = "DemoDB"
}

variable "hostname" {
  default = "demodb"
}

variable "data_storage_percentage" {
  default = "40"
}

variable "data_storage_size_in_gb" {
  default = "256"
}

variable "license_model" {
  default = "BRING_YOUR_OWN_LICENSE"
}

variable "node_count" {
  default = "1"
}

# Instance (Web / Coherence / JCS)

variable "instance_shape" {
  default = "VM.Standard2.1"
}

## JCS
# variable "jcs_admin_password" {
#   default = "Welcome_1"
# }


## Storage 

# variable "storage_username" {
#   default = "mee-nam.lee@oracle.com"
# }
#variable "storage_auth_token_token" {}

## Instance (Web / Coherence)
variable "instance_image_ocid" {
  type = "map"

  default = {
    // custom image OCID
    web= "ocid1.image.oc1.phx.aaaaaaaa5bxabwjdny6dpaf2xr63rvxoofxslzkahjnfqlcpodfl5oobualq"
    coherence ="ocid1.image.oc1.phx.aaaaaaaacp2wktef46wf255fh3lu3df6rea52dd2zjcqz34wmoj7tigbxeka"
  }
}
