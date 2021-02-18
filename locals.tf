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
}