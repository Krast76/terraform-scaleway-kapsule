## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| scaleway | 2.0.0-rc.2 |

## Providers

| Name | Version |
|------|---------|
| scaleway | 2.0.0-rc.2 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [scaleway_k8s_cluster](https://registry.terraform.io/providers/scaleway/scaleway/2.0.0-rc.2/docs/resources/k8s_cluster) |
| [scaleway_k8s_pool](https://registry.terraform.io/providers/scaleway/scaleway/2.0.0-rc.2/docs/resources/k8s_pool) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admission\_plugins | n/a | `list(string)` | `[]` | no |
| auto\_upgrade | Auto upgrade configuration | `any` | `null` | no |
| autoscaler\_config | Autoscaler configuration | `any` | `null` | no |
| cluster\_cni | CNI Deployed in the kapsule cluster. Caution, updating this field cause recreate | `string` | `"unknown_cni"` | no |
| cluster\_description | n/a | `string` | `null` | no |
| cluster\_enable\_dashboard | Enable the default kubernetes dashboard | `bool` | `false` | no |
| cluster\_ingress | Ingress controller that will run on the cluster <br> Possible values are unknown\_ingress, nginx, traefik & traefik2 | `string` | `"none"` | no |
| cluster\_name | The name of the kapsule cluster | `string` | n/a | yes |
| cluster\_tags | n/a | `list(string)` | `[]` | no |
| cluster\_version | n/a | `string` | `"1.20.2"` | no |
| delete\_additional\_resources | Delete all resources created by Kubernetes (such as block devices) | `bool` | `true` | no |
| feature\_gates | n/a | `list(string)` | `[]` | no |
| nodepools | nodepools variable | `any` | n/a | yes |
| tags | Tags shared by all resources | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| apiserver\_url | n/a |
| kapsule\_id | Kapsule instance ID |
| kapsule\_upgrade\_available | Set to true if a newer Kubernetes version is available |
| kapsule\_wildcard\_dns | DNS wildcard that points to all ready nodes |
| kubeconfig | n/a |
| nodepools | n/a |
