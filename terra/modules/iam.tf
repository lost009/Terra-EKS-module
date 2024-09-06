
# EKS role 

resource "aws_iam_role" "eks_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "eks.amazonaws.com"
        },
        Action = "sts:AssumeRole",
      },
    ],
  })

  tags = {
    Name = "service-role"
  }
}

# Attach the existing IAM policy to the role
resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
    for_each = toset(var.policy_arn)

    policy_arn = each.value

    role       = aws_iam_role.eks_role.name
}



#node group role 


resource "aws_iam_role" "node_role" {
  name = var.node_role
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole",
      },
    ],
  })

  tags = {
    Name = "service-role"
  }
}

resource "aws_iam_role_policy_attachment" "role_attach" {
  for_each = toset(var.node_policy_arns)

  policy_arn = each.value
  role       = aws_iam_role.node_role.name
}

