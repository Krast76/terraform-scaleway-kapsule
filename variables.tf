variable "region" {
  type = string
  default = "fr-par"
}

// Global variables
variable "tags" {
  type        = list(string)
  default     = []
  description = "Tags shared by all resources"
}

// Cluster variables
variable "cluster_name" {
  type        = string
  description = "The name of the kapsule cluster"
}

variable "cluster_description" {
  type    = string
  default = null

}
variable "cluster_version" {
  type    = string
  default = "1.20.2"

  validation {
    condition     = can(regex("[:digit:].[:digit:].[:digit:]", var.cluster_version))
    error_message = "The value must look like that 1.20.2."
  }
}

variable "cluster_cni" {
  type        = string
  description = "CNI Deployed in the kapsule cluster. Caution, updating this field cause recreate"
  default     = "unknown_cni"

  validation {
    condition     = contains(["unknown_cni", "cilium", "calico", "weave", "flannel"], var.cluster_cni)
    error_message = "Only the following CNI are supported : cilium, calico, weave, flannel and unknown_cni.\n  Caution, updating this field cause recreate a new resource."
  }
}

variable "cluster_enable_dashboard" {
  type        = bool
  description = "Enable the default kubernetes dashboard"
  default     = false
}

variable "cluster_ingress" {
  type        = string
  description = "Ingress controller that will run on the cluster \n Possible values are unknown_ingress, nginx, traefik & traefik2 "
  default     = "none"

  validation {
    condition     = contains(["none", "unknown_ingress", "nginx", "traefik", "traefik2"], var.cluster_ingress)
    error_message = "Should be one of this values : none, unknown_ingress, nginx, traefik, traefik2."
  }
}

variable "cluster_tags" {
  type    = list(string)
  default = []
}

variable "feature_gates" {
  type    = list(string)
  default = []
}

variable "admission_plugins" {
  type    = list(string)
  default = []
}

variable "delete_additional_resources" {
  type        = bool
  description = "Delete all resources created by Kubernetes (such as block devices)"
  default     = true

}