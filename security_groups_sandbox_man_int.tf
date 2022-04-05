resource "openstack_networking_secgroup_v2" "sandbox_man_int" {
  name                 = "kypo-sandbox-man-int-sg"
  delete_default_rules = true
  description          = "Security Group for management interfaces of user-defined nodes"
}

resource "openstack_networking_secgroup_rule_v2" "sandbox_man_int_dhcp" {
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 67
  port_range_max    = 67
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.sandbox_man_int.id
}

resource "openstack_networking_secgroup_rule_v2" "remote_sandbox_man_int_sandbox_man_syslog" {
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 515
  port_range_max    = 515
  remote_group_id   = openstack_networking_secgroup_v2.sandbox_man.id
  security_group_id = openstack_networking_secgroup_v2.sandbox_man_int.id
}

resource "openstack_networking_secgroup_rule_v2" "remote_sandbox_man_int_sandbox_man_icmp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_group_id   = openstack_networking_secgroup_v2.sandbox_man.id
  security_group_id = openstack_networking_secgroup_v2.sandbox_man_int.id
}

resource "openstack_networking_secgroup_rule_v2" "remote_sandbox_man_int_sandbox_man_ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_group_id   = openstack_networking_secgroup_v2.sandbox_man.id
  security_group_id = openstack_networking_secgroup_v2.sandbox_man_int.id
}

resource "openstack_networking_secgroup_rule_v2" "remote_sandbox_man_int_sandbox_man_winrm" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 5986
  port_range_max    = 5986
  remote_group_id   = openstack_networking_secgroup_v2.sandbox_man.id
  security_group_id = openstack_networking_secgroup_v2.sandbox_man_int.id
}
