resource "openstack_networking_network_v2" "network" {
  name           = "base-net"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet" {
  name            = "base-subnet"
  network_id      = openstack_networking_network_v2.network.id
  cidr            = var.network_cidr
  gateway_ip      = cidrhost(var.network_cidr, 1)
  ip_version      = 4
  enable_dhcp     = true
  dns_nameservers = var.dns_nameservers

  allocation_pool {
    start = cidrhost(var.network_cidr, 10)
    end   = cidrhost(var.network_cidr, -2)
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
    ip_address = cidrhost(var.network_cidr, 1)
  }
}

resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id = openstack_networking_router_v2.router.id
  port_id   = openstack_networking_port_v2.port.id
}
