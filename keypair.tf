resource "tls_private_key" "admin" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P384"
}

data "openstack_identity_auth_scope_v3" "scope" {
  name = "my_scope"
}

resource "openstack_compute_keypair_v2" "keypair" {
  name       = "${data.openstack_identity_auth_scope_v3.scope.project_name}-kypo"
  public_key = tls_private_key.admin.public_key_openssh
}
