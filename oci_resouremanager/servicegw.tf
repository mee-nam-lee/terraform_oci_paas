data "oci_core_services" "test_services" {
  filter {
    name   = "name"
#    values = ["All .* Services In Oracle Services Network"]
    values = ["OCI .* Object Storage"]
    regex  = true
  }
}
resource "oci_core_service_gateway" "sg1" {
  compartment_id = "${var.compartment_ocid}"

  services {
    service_id = "${lookup(data.oci_core_services.test_services.services[0], "id")}"
  }

  vcn_id = "${oci_core_virtual_network.vcn1.id}"

  display_name = "ServiceGateway"
}
