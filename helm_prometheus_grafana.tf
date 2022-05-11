
/*
resource "kubernetes_namespace" "test-namespace" {
  metadata {
        name = "monitoring"
  }
}

resource "helm_release" "prometheus" {
  name       = "prometheus"
  namespace  = "monitoring"
  

  #repository = "https://charts.bitnami.com/bitnami"
  chart      = "/home/ec2-user/environment/clones/prom_graf_stack/prometheus"

  set {
    name  = "service.type"
    value = "NodePort"
  }
}

resource "helm_release" "grafana" {
  name       = "grafana"
  namespace  = "monitoring"
  

  #repository = "https://charts.bitnami.com/bitnami"
  chart      = "/home/ec2-user/environment/clones/prom_graf_stack/grafana"

  set {
    name  = "service.type"
    value = "NodePort"
  }
}



*/