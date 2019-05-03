output "web1_public_ip" {
  value = ["${oci_core_instance.web1.public_ip}"]
}

output "web2_public_ip" {
  value = ["${oci_core_instance.web2.public_ip}"]
}

output "loadbalancer_public_ip" {
  value = ["${oci_load_balancer_load_balancer.lb.ip_addresses}"]
}

output "coherence1_private_ip" {
  value = ["${oci_core_instance.coherence1.private_ip}"]
}

output "coherence2_private_ip" {
  value = ["${oci_core_instance.coherence2.private_ip}"]
}
