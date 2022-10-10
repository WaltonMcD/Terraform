resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "long-live-the-bat"
    labels = {
      App = "web-app"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "web-app"
      }
    }
    template {
      metadata {
        labels = {
          App = "web-app"
        }
      }
      spec {
        container {
          image = "nginx:1.7.8"
          name  = "demo-app"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
