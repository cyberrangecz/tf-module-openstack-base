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
