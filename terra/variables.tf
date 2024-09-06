
variable "env" {
  description = "The environment in which the EKS cluster is deployed"
  type        = string
}

variable "account" {
  description = "The AWS account ID"
  type        = string
}

variable "cluster_version" {
  description = "The version of the EKS cluster"
  type        = string
}

variable "security_group" {
  description = "List of security group IDs to associate with the EKS cluster"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs to associate with the EKS cluster"
  type        = list(string)
}



variable "instance_types" {
  description = "List of instance types for the node group"
  type        = list(string)
}

variable "desired_size" {
  description = "The desired number of nodes in the node group"
  type        = number
}

variable "max_size" {
  description = "The maximum number of nodes in the node group"
  type        = number
}

variable "min_size" {
  description = "The minimum number of nodes in the node group"
  type        = number
}
