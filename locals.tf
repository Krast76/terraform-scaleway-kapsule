locals {
  cluster_name                = var.cluster_name
  cluster_description         = var.cluster_description
  cluster_version             = var.cluster_version
  cluster_cni                 = var.cluster_cni
  cluster_enable_dashboard    = var.cluster_enable_dashboard
  cluster_ingress             = var.cluster_ingress
  cluster_tags                = concat(var.tags, var.cluster_tags)
  feature_gates               = var.feature_gates
  admission_plugins           = var.admission_plugins
  delete_additional_resources = var.delete_additional_resources

  nodepool_default = {
    node_type          = "DEV1_M"
    size               = 1
    min_size           = 1
    max_size           = 1
    autoscaling        = false
    autohealing        = true
    container_runtime  = "docker"
    placement_group_id = null
  }

  nodepools = var.nodepools

  autoscaler_defaults = {
    disable_scale_down               = false
    scale_down_delay_after_add       = "10m"
    scale_down_unneeded_time         = "10m"
    estimator                        = "binpacking"
    expander                         = "random"
    ignore_daemonsets_utilization    = "false"
    balance_similar_node_groups      = "false"
    expendable_pods_priority_cutoff  = "-10"
    scale_down_utilization_threshold = "0.5"
    max_graceful_termination_sec     = "600"
  }

  autoscaler_config = merge(
    local.autoscaler_defaults,
    var.autoscaler_config
  )

  auto_upgrade_default = {
    enable                        = false
    maintenance_window_start_hour = null
    mainteance_window_day         = null

  }

  auto_upgrade = merge(
    local.auto_upgrade_default,
    var.auto_upgrade
  )

}