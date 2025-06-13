variable "cluster_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "k8s_version" {
  type    = string
  default = "1.29"
}

variable "cluster_role_arn" {
  type = string
}

variable "node_role_arn" {
  type = string
}
