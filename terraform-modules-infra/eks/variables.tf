variable "cluster_name" { type = string }
variable "cluster_version" { type = string }
variable "cluster_endpoint_public_access" { type = bool }
variable "enable_cluster_creator_admin_permissions" { type = bool }
variable "bootstrap_self_managed_addons" { type = bool }

variable "vpc_id" { type = string }
variable "subnet_ids" { type = list(string) }
variable "control_plane_subnet_ids" { type = list(string) }

variable "cluster_addons" { type = any }
variable "eks_managed_node_group_defaults" { type = any }
variable "eks_managed_node_groups" { type = any }
variable "cluster_compute_config" { type = any }
variable "access_entries" { type = any }

variable "tags" { type = map(string) }

# variable "cluster_role_arn" {
#   type        = string
#   description = "ARN of IAM role for EKS control plane"
# }

# variable "node_role_arn" {
#   type        = string
#   description = "ARN of IAM role for EKS worker nodes"
# }


