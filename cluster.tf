resource "scaleway_k8s_cluster" "this" {
  name        = local.cluster_name
  description = local.cluster_description

  version                     = local.cluster_version
  cni                         = local.cluster_cni
  enable_dashboard            = local.cluster_enable_dashboard
  ingress                     = local.cluster_ingress
  tags                        = local.cluster_tags
  feature_gates               = local.feature_gates
  admission_plugins           = local.admission_plugins
  delete_additional_resources = local.delete_additional_resources

  dynamic "autoscaler_config" {
    for_each = var.autoscaler_config != null ? [1] : []
    content {
      disable_scale_down               = local.autoscaler_config["disable_scale_down"]
      scale_down_delay_after_add       = local.autoscaler_config["scale_down_delay_after_add"]
      scale_down_unneeded_time         = local.autoscaler_config["scale_down_unneeded_time"]
      estimator                        = local.autoscaler_config["estimator"]
      expander                         = local.autoscaler_config["expander"]
      ignore_daemonsets_utilization    = local.autoscaler_config["ignore_daemonsets_utilization"]
      balance_similar_node_groups      = local.autoscaler_config["balance_similar_node_groups"]
      expendable_pods_priority_cutoff  = local.autoscaler_config["expendable_pods_priority_cutoff"]
      scale_down_utilization_threshold = local.autoscaler_config["scale_down_utilization_threshold"]
      max_graceful_termination_sec     = local.autoscaler_config["max_graceful_termination_sec"]
    }
  }

  dynamic "auto_upgrade" {
    for_each = local.auto_upgrade["enable"] ? [1] : []
    content {
      enable                        = local.auto_upgrade["enable"]
      maintenance_window_start_hour = local.auto_upgrade["maintenance_window_start_hour"]
      maintenance_window_day        = local.auto_upgrade["maintenance_window_day"]
    }
  }
}