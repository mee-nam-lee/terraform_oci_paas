resource "oci_core_route_table" "rt1" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_virtual_network.vcn1.id}"
  display_name   = "PublicRT"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = "${oci_core_internet_gateway.ig1.id}"
  }
}

resource "oci_core_route_table" "rt2" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_virtual_network.vcn1.id}"
  display_name   = "PrivateRT"

  route_rules {
    destination       = "${lookup(data.oci_core_services.test_services.services[0], "cidr_block")}"
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = "${oci_core_service_gateway.sg1.id}"
  }
}
