resource "openstack_networking_network_v2" "network" {
  name           = "base-net"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet" {
  name            = "base-subnet"
  network_id      = openstack_networking_network_v2.network.id
  cidr            = "192.168.64.0/18"
  gateway_ip      = "192.168.64.1"
  ip_version      = 4
  enable_dhcp     = true
  dns_nameservers = var.dns_nameservers

  allocation_pool {
    start = "192.168.64.10"
    end   = "192.168.127.254"
  }
}

data "openstack_networking_network_v2" "external_network" {
  name = var.external_network_name
}

resource "openstack_networking_router_v2" "router" {
  name                = "base-router-public"
  admin_state_up      = true
  external_network_id = data.openstack_networking_network_v2.external_network.id
}


resource "openstack_networking_port_v2" "port" {
  name           = "base-router-public-port"
  network_id     = openstack_networking_network_v2.network.id
  admin_state_up = "true"

  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet.id
    ip_address = "192.168.64.1"
  }
}

resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id = openstack_networking_router_v2.router.id
  port_id   = openstack_networking_port_v2.port.id
}
