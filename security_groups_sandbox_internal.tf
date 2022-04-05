resource "openstack_networking_secgroup_v2" "sandbox_internal" {
  name        = "kypo-sandbox-internal-sg"
  description = "Security Group for interfaces of user network"
}

resource "openstack_networking_secgroup_rule_v2" "sandbox_internal_all" {
  direction         = "ingress"
  ethertype         = "IPv4"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.sandbox_internal.id
}
