output "keypair_name" {
  value       = openstack_compute_keypair_v2.keypair.name
  description = "OpenStack keypair name used by proxy jump and Kuberentes cluster instances"
}

output "private_key" {
  value       = tls_private_key.admin.private_key_pem
  description = "SSH private key for accessing proxy jump and Kuberentes cluster instances"
}

output "network_id" {
  value       = openstack_networking_network_v2.network.id
  description = "Id of OpenStack internal network used by proxy jump and Kuberentes cluster instances"
}

output "sg_proxy_name" {
  value       = openstack_networking_secgroup_v2.proxy.name
  description = "Name of proxy jump security group"
}

output "sg_head_name" {
  value       = openstack_networking_secgroup_v2.head.name
  description = "Name of security group used by Kubernetes cluster instance hosting head services"
}
