resource "oci_objectstorage_bucket" "jcs_bucket1" {
  compartment_id = "${var.compartment_ocid}"
  namespace      = "${data.oci_objectstorage_namespace.ns.namespace}"
  name           = "jcs-bucket1"
  access_type    = "NoPublicAccess"
}

resource "oci_objectstorage_bucket" "jcs_bucket2" {
  compartment_id = "${var.compartment_ocid}"
  namespace      = "${data.oci_objectstorage_namespace.ns.namespace}"
  name           = "jcs-bucket2"
  access_type    = "NoPublicAccess"
}