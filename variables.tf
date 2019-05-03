# PaaS Provider
variable "identity_domain" {}
variable "user" {}
variable "password" {}
variable "java_endpoint" {}

# Identity and access parameters
variable "fingerprint" {
  description = "fingerprint of oci api private key"
}

variable "private_key_path" {
  description = "path to oci api private key"
}

variable "compartment_ocid" {
  type        = "string"
  description = "compartment id"
}

variable "tenancy_ocid" {
  type        = "string"
  description = "tenancy id"
}

variable "tenancy" {
  type        = "string"
  description = "tenancy name"
}

variable "user_ocid" {
  type        = "string"
  description = "user ocid"
}

variable "ssh_public_key" {
  description = "ssh public key"
}

# general oci parameters

variable "disable_auto_retries" {
  default = true
}

variable "region" {
  description = "region"
  default     = ""
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
variable "jcs_admin_password" {
  default = "Welcome_1"
}


## Storage 

variable "storage_username" {}
variable "storage_auth_token_token" {}

## Instance (Web / Coherence)
variable "instance_image_ocid" {
  type = "map"

  default = {
    // custom image OCID
    web= "ocid1.image.oc1.phx.aaaaaaaa5bxabwjdny6dpaf2xr63rvxoofxslzkahjnfqlcpodfl5oobualq"
    coherence ="ocid1.image.oc1.phx.aaaaaaaacp2wktef46wf255fh3lu3df6rea52dd2zjcqz34wmoj7tigbxeka"
  }
}
