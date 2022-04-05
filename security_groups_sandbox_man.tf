resource "openstack_networking_secgroup_v2" "sandbox_man" {
  name        = "kypo-sandbox-man-sg"
  description = "Security Group for management interface of MAN node"
}

resource "openstack_networking_secgroup_rule_v2" "sandbox_man_sandbox_man_int_syslog" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 515
  port_range_max    = 515
  remote_group_id   = openstack_networking_secgroup_v2.sandbox_man_int.id
  security_group_id = openstack_networking_secgroup_v2.sandbox_man.id
}
