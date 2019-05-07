resource "oci_core_internet_gateway" "ig1" {
  compartment_id = "${var.compartment_ocid}"
  display_name   = "InternetGateway"
  vcn_id         = "${oci_core_virtual_network.vcn1.id}"
}