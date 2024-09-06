
variable "role_name" {
  description = "control-plane-role-name"
  type        = string
}


variable "node_role" {
  description = "node group role name"
  type        = string
}


variable "policy_arn" {
  description = "policy arn"
  type        = list(string)
  default = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  ]


}


variable "cluster_name" {
  description = "eks cluster name"
  type        = string
}

variable "env" {
  description = "eks cluster env"
  type        = string
}

variable "account" {
  description = "eks cluster account"
  type        = string
}


variable "cluster_version" {
  description = "eks cluster version"
  type        = number
}


variable "security_group" {
  description = "sec-group"
  type        = list(string)
  default     = []
}

variable "subnet_ids" {
  description = "subnet-ids"
  type        = list(string)
  default     = []
}





variable "node_policy_arns" {
  description = "node policy arns"
  type        = list(string)
  default = [
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  ]
}

variable "addons" {
  description = "write name of addons"
  type        = list(string)
  default = [
#    "CoreDNS",
#   "Amazon VPC CNI",
    "kube-proxy",
#    "Amazon EKS Pod Identity Agent",
#    "aws-ebs-csi-driver = v1.30.0-eksbuild.1"
  ]
}

variable "node_name" {
  description = "node group name"
  type        = string
}

variable "instance_types" {
  description = "Node group instance types"
  type        = list(string)
}

variable "desired_size" {
  description = "The desired size of the auto-scaling group"
  type        = number
}

variable "max_size" {
  description = "The maximum size of the auto-scaling group"
  type        = number
}

variable "min_size" {
  description = "The minimum size of the auto-scaling group"
  type        = number
}
