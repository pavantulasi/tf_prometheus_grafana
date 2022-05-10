/*
data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}
data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "prometheus-eks"
  cluster_version = "1.21"
  subnet_ids	  = module.vpc.private_subnets   
  vpc_id          = module.vpc.vpc_id
  eks_managed_node_groups = {
    blue = {}
    green = {
      min_size     = 1
      max_size     = 3
      desired_size = 1

      instance_types = ["t3.small"]
      capacity_type  = "SPOT"
    }
  }
}
resource "null_resource" "test_eks" {
  depends_on = [module.eks]
  provisioner "local-exec" {
    command = "aws eks --region eu-west-1  update-kubeconfig --name $AWS_CLUSTER_NAME"
    environment = {
      AWS_CLUSTER_NAME = "prometheus-eks"
    }
  }
}

*/


