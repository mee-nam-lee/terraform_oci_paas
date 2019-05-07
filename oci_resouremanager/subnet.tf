resource "oci_core_subnet" "subnet1" {
  cidr_block        = "10.0.1.0/24"
  display_name      = "VCN_3Tier_Sub_WEB"
  dns_label         = "web"
  compartment_id    = "${var.compartment_ocid}"
  vcn_id            = "${oci_core_virtual_network.vcn1.id}"
  security_list_ids = ["${oci_core_security_list.seculist1.id}"]
  route_table_id    = "${oci_core_route_table.rt1.id}"
  dhcp_options_id   = "${oci_core_virtual_network.vcn1.default_dhcp_options_id}"
}

resource "oci_core_subnet" "subnet2" {
  cidr_block        = "10.0.2.0/24"
  display_name      = "VCN_3Tier_Sub_WAS"
  dns_label         = "was"
  compartment_id    = "${var.compartment_ocid}"
  vcn_id            = "${oci_core_virtual_network.vcn1.id}"
  security_list_ids = ["${oci_core_security_list.seculist2.id}"]
  route_table_id    = "${oci_core_route_table.rt2.id}"
  dhcp_options_id   = "${oci_core_virtual_network.vcn1.default_dhcp_options_id}"
  prohibit_public_ip_on_vnic = "true"
}

resource "oci_core_subnet" "subnet3" {
  cidr_block        = "10.0.3.0/24"
  display_name      = "VCN_3Tier_Sub_DB"
  dns_label         = "db"
  compartment_id    = "${var.compartment_ocid}"
  vcn_id            = "${oci_core_virtual_network.vcn1.id}"
  security_list_ids = ["${oci_core_security_list.seculist3.id}"]
  route_table_id    = "${oci_core_route_table.rt2.id}"
  dhcp_options_id   = "${oci_core_virtual_network.vcn1.default_dhcp_options_id}"
  prohibit_public_ip_on_vnic = "true"
}