resource "openstack_networking_secgroup_v2" "sandbox_mirror" {
  count                = var.hypervisor_cidr == null ? 0 : 1
  name                 = "sandbox-mirror-sg"
  delete_default_rules = true
  description          = "Security Group for mirror destination interfaces of network forwarding: GRE from the hypervisors, plus DHCP requests"
}

resource "openstack_networking_secgroup_rule_v2" "sandbox_mirror_gre" {
  count             = var.hypervisor_cidr == null ? 0 : 1
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "gre"
  remote_ip_prefix  = var.hypervisor_cidr
  security_group_id = openstack_networking_secgroup_v2.sandbox_mirror[0].id
}

# DHCP requests are broadcast, and renewals are unicast to the DHCP server, whose address depends
# on the sandbox subnet. OVN lets its own DHCP replies through, so no ingress rule is needed.
resource "openstack_networking_secgroup_rule_v2" "sandbox_mirror_dhcp_request" {
  count             = var.hypervisor_cidr == null ? 0 : 1
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 67
  port_range_max    = 67
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.sandbox_mirror[0].id
}
