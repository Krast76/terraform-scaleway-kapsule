// k8s instance outputs
output "kapsule_id" {
  value       = scaleway_k8s_cluster.this.id
  description = "Kapsule instance ID"

}

output "kapsule_wildcard_dns" {
  value       = scaleway_k8s_cluster.this.wildcard_dns
  description = "DNS wildcard that points to all ready nodes"
}

output "apiserver_url" {
  value = scaleway_k8s_cluster.this.apiserver_url
}

output "kubeconfig" {
  value     = scaleway_k8s_cluster.this.kubeconfig[0]
  sensitive = true
}

output "kapsule_upgrade_available" {
  value       = scaleway_k8s_cluster.this.upgrade_available
  description = "Set to true if a newer Kubernetes version is available"
}

// k8s nodepool outputs

output "nodepools" {
  value = scaleway_k8s_pool.this
}