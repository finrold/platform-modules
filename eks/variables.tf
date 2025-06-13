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
  type    = string
  default = null
}

variable "fargate_pod_execution_role_arn" {
  type    = string
  default = null
}

variable "enable_node_group" {
  type    = bool
  default = true
}

variable "enable_fargate" {
  type    = bool
  default = false
}

variable "enable_fargate_profile" {
  type    = bool
  default = false
}

variable "instance_types" {
  type        = list(string)
  default     = ["t3.medium"]
  description = "Lista de tipos de instância para o Node Group (apenas se enable_node_group = true)"
}
