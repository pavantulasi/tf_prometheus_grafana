
/*

resource "aws_iam_role" "eks-role" {
  name = "terraform-prometheus-eks"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "prometheus-eks-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-role.name
}

resource "aws_iam_role_policy_attachment" "prometheus-eks-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.eks-role.name
}

resource "aws_security_group" "prometheus-eks-sg" {
  name        = "terraform-prometheus-eks"
  description = "Cluster communication with worker nodes"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "terraform-eks"
  }
}


resource "aws_security_group_rule" "prometheus-eks-ingress-workstation-https" {
  cidr_blocks       = [local.workstation-external-cidr]
  description       = "Allow workstation to communicate with the cluster API Server"
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.demo-cluster.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_eks_cluster" "prometheus-eks" {
  name     = var.cluster-name
  role_arn = aws_iam_role.eks-role.arn
  vpc_config {
    security_group_ids = [aws_security_group.prometheus-eks-sg.id]
    subnet_ids         = aws_subnet.eks-subnet[*].id
  }
  depends_on = [
    aws_iam_role_policy_attachment.prometheus-eks-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.prometheus-eks-AmazonEKSServicePolicy,
  ]
}

*/