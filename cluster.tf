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

}