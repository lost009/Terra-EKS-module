
resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.cluster_name}-${var.env}-${var.account}"
  role_arn = aws_iam_role.eks_role.arn
  version  = var.cluster_version

  vpc_config {
    security_group_ids      = var.security_group
    subnet_ids              = var.subnet_ids
    endpoint_private_access = "true"
    endpoint_public_access  = "true"
  }

  depends_on = [
    aws_iam_role.eks_role
  ]


  tags = {
    Name = "${var.cluster_name}-${var.env}"
  }
}

resource "aws_eks_addon" "eks_addon" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  for_each     = toset(var.addons)

  addon_name = each.value
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.node_name}-${var.env}-${var.account}"
  node_role_arn   = aws_iam_role.node_role.arn
  subnet_ids      = var.subnet_ids
  instance_types  = var.instance_types

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }
  depends_on = [aws_iam_role.eks_role]
}


