resource "oraclepaas_java_service_instance" "jcs1" {
  name        = "jcs1"
  description = "Example Terraformed JCS with OCI DB"

  edition                = "EE"            
  service_version        = "12cRelease213"
  metering_frequency     = "HOURLY"
  bring_your_own_license = true

  ssh_public_key = "${var.ssh_public_key}"

  region              = "${var.region}"
  availability_domain =  "${data.oci_identity_availability_domain.ad1.name}"

  subnet              = "${oci_core_subnet.subnet2.id}"

  weblogic_server {
    shape = "${var.instance_shape}"
    managed_servers {
      server_count = 1
    }

    connect_string = "//${oci_database_db_system.db.hostname}-scan.${oci_core_subnet.subnet3.subnet_domain_name}:1521/${oci_database_db_system.db.db_home.0.database.0.pdb_name}.${oci_core_subnet.subnet3.subnet_domain_name}"

    database {
      username = "sys"
      password = "${oci_database_db_system.db.db_home.0.database.0.admin_password}"
    }

    admin {
      username = "weblogic"
      password = "${var.jcs_admin_password}"
    }
  }
  enable_admin_console = true

  backups {
    cloud_storage_container = "https://swiftobjectstorage.${var.region}.oraclecloud.com/v1/${var.tenancy}/${oci_objectstorage_bucket.jcs_bucket1.name}"
    cloud_storage_username  = "${var.storage_username}"
    cloud_storage_password  = "${var.storage_auth_token_token}"
  }
}

resource "oraclepaas_java_service_instance" "jcs2" {
  name        = "jcs2"
  description = "Example Terraformed JCS with OCI DB"

  edition                = "EE"            
  service_version        = "12cRelease213"
  metering_frequency     = "HOURLY"
  bring_your_own_license = true

  ssh_public_key = "${var.ssh_public_key}"

  region              = "${var.region}"

  availability_domain =  "${data.oci_identity_availability_domain.ad2.name}"

  subnet              = "${oci_core_subnet.subnet2.id}"

  weblogic_server {
    shape = "${var.instance_shape}"
    managed_servers {
      server_count = 1
    }

    connect_string = "//${oci_database_db_system.db.hostname}-scan.${oci_core_subnet.subnet3.subnet_domain_name}:1521/${oci_database_db_system.db.db_home.0.database.0.pdb_name}.${oci_core_subnet.subnet3.subnet_domain_name}"

    database {
      username = "sys"
      password = "${oci_database_db_system.db.db_home.0.database.0.admin_password}"
    }

    admin {
      username = "weblogic"
      password = "${var.jcs_admin_password}"
    }
  }
  enable_admin_console = true

  backups {
    cloud_storage_container = "https://swiftobjectstorage.${var.region}.oraclecloud.com/v1/${var.tenancy}/${oci_objectstorage_bucket.jcs_bucket2.name}"
    cloud_storage_username  = "${var.storage_username}"
    cloud_storage_password  = "${var.storage_auth_token_token}"
  }
}