resource "openstack_networking_secgroup_v2" "sandbox_access" {
  name        = "kypo-sandbox-access-sg"
  description = "Security Group for access point to sandbox"
}

resource "openstack_networking_secgroup_rule_v2" "remote_sandbox_access_head_tcp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_group_id   = openstack_networking_secgroup_v2.head.id
  security_group_id = openstack_networking_secgroup_v2.sandbox_access.id
}

resource "openstack_networking_secgroup_rule_v2" "remote_sandbox_access_head_udp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  remote_group_id   = openstack_networking_secgroup_v2.head.id
  security_group_id = openstack_networking_secgroup_v2.sandbox_access.id
}

resource "openstack_networking_secgroup_rule_v2" "remote_sandbox_access_proxy_tcp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_group_id   = openstack_networking_secgroup_v2.proxy.id
  security_group_id = openstack_networking_secgroup_v2.sandbox_access.id
}

resource "openstack_networking_secgroup_rule_v2" "remote_sandbox_access_proxy_udp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  remote_group_id   = openstack_networking_secgroup_v2.proxy.id
  security_group_id = openstack_networking_secgroup_v2.sandbox_access.id
}
