
module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  name               = "prom-vpc"
  cidr               = "10.250.0.0/19"
  azs                = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets    = ["10.250.0.0/23", "10.250.6.0/23", "10.250.12.0/23"]
  public_subnets     = ["10.250.2.0/23", "10.250.8.0/23", "10.250.14.0/23"]
  enable_nat_gateway = false
  enable_vpn_gateway = false
  tags = {
    Terraform   = "true"
    Environment = "test"
  }
  public_subnet_tags = {
    "kubernetes.io/cluster/prometheus-eks" = "prometheus"
    "kubernetes.io/role/elb"             = 1
  }
  private_subnet_tags = {
    "kubernetes.io/cluster/prometheus-eks" = "prometheus"
    "kubernetes.io/role/internal-elb"    = "1"
  }
}


