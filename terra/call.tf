module "eks" {
  source = "./modules"

  role_name       = "my-eks-role"
  node_role       = "my-node-role"
  cluster_name    = "my-cluster"
  env             = var.env
  account         = var.account
  cluster_version = var.cluster_version
  security_group  = var.security_group
  subnet_ids      = var.subnet_ids
  node_name       = "my-node-group"
  instance_types  = var.instance_types
  desired_size    = var.desired_size
  max_size        = var.max_size
  min_size        = var.min_size
}

