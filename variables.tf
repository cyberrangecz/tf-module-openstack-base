variable "dns_nameservers" {
  type        = list(string)
  description = "List of DNS name servers used for instances"
  default     = ["1.1.1.1", "1.0.0.1"]
}

variable "external_network_name" {
  type        = string
  description = "External network name used for floating IP allocation"
}

variable "network_cidr" {
  description = "CIDR block for the base-subnet"
  type        = string
  default     = "192.168.64.0/18"
}

variable "hypervisor_cidr" {
  description = "Narrowest CIDR covering the tunnel source addresses of the compute nodes, which send the mirrored GRE traffic. Required for network forwarding"
  type        = string
  default     = null

  validation {
    condition     = var.hypervisor_cidr == null || try(!strcontains(var.hypervisor_cidr, ":") && cidrhost(var.hypervisor_cidr, 0) == split("/", var.hypervisor_cidr)[0], false)
    error_message = "The hypervisor_cidr value must be an IPv4 CIDR block without host bits set, for example 10.0.0.0/24."
  }
}
