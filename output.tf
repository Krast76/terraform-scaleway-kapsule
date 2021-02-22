output "apiserver_url" {
  value     = scaleway_k8s_cluster.this.apiserver_url
}

output "kubeconfig" {
  value = scaleway_k8s_cluster.this.kubeconfig[0]
  sensitive = true
}
