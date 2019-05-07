resource "oci_core_security_list" "seculist1" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_virtual_network.vcn1.id}"
  display_name   = "PublicSL"

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "80"
      min = "80"
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "22"
      min = "22"
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "${oci_core_virtual_network.vcn1.cidr_block}"
  }

  ingress_security_rules {
    protocol = "1"
    source   = "0.0.0.0/0"
  }

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

}
resource "oci_core_security_list" "seculist2" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_virtual_network.vcn1.id}"
  display_name   = "PrivateSL"

  ingress_security_rules {
    protocol = "6"
    source   = "${oci_core_virtual_network.vcn1.cidr_block}"
  }

  ingress_security_rules {
    protocol = "1"
    source   = "${oci_core_virtual_network.vcn1.cidr_block}"
  }

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

}

resource "oci_core_security_list" "seculist3" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_virtual_network.vcn1.id}"
  display_name   = "DBSL"

  ingress_security_rules {
    protocol = "6"
    source   = "${oci_core_subnet.subnet2.cidr_block}"
    
    tcp_options {
      max = "1521"
      min = "1521"
    }
  }

  ingress_security_rules {
    protocol = "1"
    source   = "${oci_core_virtual_network.vcn1.cidr_block}"
  }
  
  egress_security_rules {
    destination = "${oci_core_virtual_network.vcn1.cidr_block}"
    protocol    = "all"
  }
}
