resource "oci_core_instance" "web1" {
  availability_domain = "${data.oci_identity_availability_domain.ad1.name}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "web1"
  shape               = "${var.instance_shape}"

  create_vnic_details {
    subnet_id        = "${oci_core_subnet.subnet1.id}"
    display_name     = "primaryvnic"
    assign_public_ip = true
    hostname_label   = "web1"
  }

  source_details {
    source_type = "image"
    source_id   = "${var.instance_image_ocid["web"]}"
  }

  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
  }
}

resource "oci_core_instance" "web2" {
  availability_domain = "${data.oci_identity_availability_domain.ad2.name}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "web2"
  shape               = "${var.instance_shape}"

  create_vnic_details {
    subnet_id        = "${oci_core_subnet.subnet1.id}"
    display_name     = "primaryvnic"
    assign_public_ip = true
    hostname_label   = "web2"
  }

  source_details {
    source_type = "image"
    source_id   = "${var.instance_image_ocid["web"]}"
  }

  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
  }
}

