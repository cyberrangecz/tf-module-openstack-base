resource "openstack_networking_secgroup_v2" "head" {
  name        = "kypo-base-head-sg"
  description = "Security Group for KYPO Head server"
}

resource "openstack_networking_secgroup_rule_v2" "remote_head_tcp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_group_id   = openstack_networking_secgroup_v2.head.id
  security_group_id = openstack_networking_secgroup_v2.head.id
}

resource "openstack_networking_secgroup_rule_v2" "remote_head_udp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  remote_group_id   = openstack_networking_secgroup_v2.head.id
  security_group_id = openstack_networking_secgroup_v2.head.id
}

resource "openstack_networking_secgroup_rule_v2" "head_ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.head.id
}

resource "openstack_networking_secgroup_rule_v2" "head_git_ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 30022
  port_range_max    = 30022
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.head.id
}

resource "openstack_networking_secgroup_rule_v2" "head_http" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.head.id
}

resource "openstack_networking_secgroup_rule_v2" "head_https" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.head.id
}

resource "openstack_networking_secgroup_rule_v2" "head_6443" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 6443
  port_range_max    = 6443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.head.id
}

resource "openstack_networking_secgroup_rule_v2" "head_8443" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8443
  port_range_max    = 8443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.head.id
}

resource "openstack_networking_secgroup_rule_v2" "head_syslog" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 515
  port_range_max    = 515
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.head.id
}

resource "openstack_networking_secgroup_rule_v2" "head_icmp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.head.id
}

resource "openstack_networking_secgroup_rule_v2" "remote_head_proxy_tcp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_group_id   = openstack_networking_secgroup_v2.proxy.id
  security_group_id = openstack_networking_secgroup_v2.head.id
}

resource "openstack_networking_secgroup_rule_v2" "remote_head_proxy_udp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  remote_group_id   = openstack_networking_secgroup_v2.proxy.id
  security_group_id = openstack_networking_secgroup_v2.head.id
}

resource "openstack_networking_secgroup_rule_v2" "remote_head_sandbox_access_tcp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_group_id   = openstack_networking_secgroup_v2.sandbox_access.id
  security_group_id = openstack_networking_secgroup_v2.head.id
}

resource "openstack_networking_secgroup_rule_v2" "remote_head_sandbox_access_udp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  remote_group_id   = openstack_networking_secgroup_v2.sandbox_access.id
  security_group_id = openstack_networking_secgroup_v2.head.id
}
