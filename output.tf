/*

output "private_subnet_ids"{
value = module.vpc.private_subnets
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "load_balancer_hostname" {
  value = kubernetes_service.java.status.0.load_balancer.0.ingress.0.hostname
}

*/