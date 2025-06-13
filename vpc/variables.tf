variable "cidr_block" {
  description = "CIDR da VPC"
  type        = string
}

variable "name" {
  description = "Nome base para os recursos"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Lista de CIDRs para subnets públicas"
  type        = list(string)
}

variable "enable_internet_gateway" {
  type    = bool
  default = true
}
