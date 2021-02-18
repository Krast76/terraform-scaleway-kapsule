resource "scaleway_k8s_pool" "this" {
  for_each = local.nodepools

  cluster_id         = scaleway_k8s_cluster.this.id
  name               = each.key
  node_type          = lookup(each.value, "node_type", local.nodepool_default["node_type"])
  size               = lookup(each.value, "size", local.nodepool_default["size"])
  min_size           = lookup(each.value, "min_size", local.nodepool_default["min_size"])
  max_size           = lookup(each.value, "max_size", local.nodepool_default["max_size"])
  autohealing        = lookup(each.value, "autohealing", local.nodepool_default["autohealing"])
  autoscaling        = lookup(each.value, "autoscaling", local.nodepool_default["autoscaling"])
  container_runtime  = lookup(each.value, "container_runtime", local.nodepool_default["container_runtime"])
  placement_group_id = lookup(each.value, "placement_group_id", local.nodepool_default["placement_group_id"])

}