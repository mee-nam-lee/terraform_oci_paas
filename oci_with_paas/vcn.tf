// Copyright (c) 2017, 2019, Oracle and/or its affiliates. All rights reserved.
resource "oci_core_virtual_network" "vcn1" {
  cidr_block     = "10.0.0.0/16"
  dns_label      = "vcn1"
  compartment_id = "${var.compartment_ocid}"
  display_name   = "vcn3tier"
}

resource "oci_core_default_dhcp_options" "default-dhcp-options" {
  manage_default_resource_id = "${oci_core_virtual_network.vcn1.default_dhcp_options_id}"
  display_name               = "default-dhcp-options"

  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }
}