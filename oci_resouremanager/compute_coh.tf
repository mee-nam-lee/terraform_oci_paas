resource "oci_core_instance" "coherence1" {
  availability_domain = "${data.oci_identity_availability_domain.ad1.name}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "coherence1"
  shape               = "${var.instance_shape}"

  create_vnic_details {
    subnet_id        = "${oci_core_subnet.subnet2.id}"
    display_name     = "primaryvnic"
    assign_public_ip = false
    hostname_label   = "coherence1"
  }

  source_details {
    source_type = "image"
    source_id   = "${var.instance_image_ocid["coherence"]}"
  }

  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
  }
}

resource "oci_core_instance" "coherence2" {
  availability_domain = "${data.oci_identity_availability_domain.ad2.name}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "coherence2"
  shape               = "${var.instance_shape}"

  create_vnic_details {
    subnet_id        = "${oci_core_subnet.subnet2.id}"
    display_name     = "primaryvnic"
    assign_public_ip = false
    hostname_label   = "coherence2"
  }

  source_details {
    source_type = "image"
    source_id   = "${var.instance_image_ocid["coherence"]}"
  }

  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
  }
}