resource "oci_database_db_system" "db" {
  availability_domain = "${data.oci_identity_availability_domain.ad1.name}"
  compartment_id      = "${var.compartment_ocid}"
  database_edition    = "${var.db_edition}"

  db_home {
    database {
      admin_password = "${var.db_admin_password}"
      db_name        = "${var.db_name}"
      character_set  = "${var.character_set}"
      db_workload    = "${var.db_workload}"
      pdb_name       = "${var.pdb_name}"

    }

    db_version   = "${var.db_version}"
    display_name = "${var.db_home_display_name}"
  }

  shape           = "${var.db_system_shape}"
  subnet_id       = "${oci_core_subnet.subnet3.id}"
  ssh_public_keys = ["${var.ssh_public_key}"]
  display_name    = "${var.db_system_display_name}"

  hostname                = "${var.hostname}"
  data_storage_size_in_gb = "${var.data_storage_size_in_gb}"
  license_model           = "${var.license_model}"
  node_count              = "${var.node_count}"

}

