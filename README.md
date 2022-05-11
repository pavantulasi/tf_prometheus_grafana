
Tools to be installed locally:

Terraform
Git
kubectl
Docker

TF statefile saved in local, provider config, run terrafom init, terraform plan and terrafrom apply for eks_vpc_02.tf (this tf will create VPC and network components)

SG and IAM - eks_role_04.tf (terrafrom plan and apply)

smaple_webapp.tf (terrafrom block will create the docker image and pushed to registry)

Prometheus and Grafana - helm_prometheus_grafana.tf (Prometheus and Grafana will be deployed through helm charts)

****END****
