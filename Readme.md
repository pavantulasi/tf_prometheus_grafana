# EKS Cluster deployment

This repo creates VPC and other network infrastructure

# Tools required locally

1. Docker
2. Terraform
3. Git client
4. IAM Authenticator 
5. kubectl

# local backend tf statefiles, provider configuration for the tools

- Local backend configured for terraform statefiles
- provider configuration for the associated tools
- initialise tf, plan and apply eks_vpc_02.tf to create the base network. This created the VPC, public subnet 

**EKS Cluster creation**

- eks_cluster_03.tf is uing public modules to create the eks cluster in eu-west-1 region. 



![image](https://user-images.githubusercontent.com/34026320/167357521-05a403ba-df49-4698-85a2-6f1aed423e3e.png)


**IAM role and Security groups**

- eks_role_04.tf is updated with IAM role and security group config

![image](https://user-images.githubusercontent.com/34026320/167368140-d79207aa-13ef-4d51-9313-30720879c2a8.png)


Sample web app deployment

One of the java web app is configured to test the deployment, this is recommended to deploy the services through CICD/Helm charts. In this the job is configured as terraform resource block is called to deply the microservice. Created the docker image and pushed to docker hub as the container registery.
High availability purposes there are 2 replicas deployed and this can be autoscaled.


sample_webappapp.tf

![image](https://user-images.githubusercontent.com/34026320/167369367-149f23e6-531a-4063-a0a3-c1180c24fe1d.png)

![image](https://user-images.githubusercontent.com/34026320/167369471-170615ee-f30b-43bb-be71-aa809ed5cc0a.png)


Checking the deployment status

![image](https://user-images.githubusercontent.com/34026320/167370061-a68f45d2-6ae1-4ad5-b9ad-06ce5373c75e.png)



![image](https://user-images.githubusercontent.com/34026320/167370721-e6db7417-9150-4e6e-877d-42f4a445e530.png)


# Service monitoring (Prometheus, Garafana, Alertmanager)

The monitoring tools are deployed theiugh helm charts, and are copied in the respective directories. 

image used for helm_prometheus_grafana.tf

![image](https://user-images.githubusercontent.com/34026320/167383684-9e51c36f-3612-4c0f-95a6-6773b5f8fb40.png)


These services are deployed under a seperate namespace 'monitoring'
![image](https://user-images.githubusercontent.com/34026320/167384008-c5d9c4f5-e580-40e0-b17d-7698f3bd3c67.png)

The web interface is not exposed to public internet, and is accessable form the workspace.

![image](https://user-images.githubusercontent.com/34026320/167384313-e8af56a3-d895-4454-aa44-e068123685ca.png)








