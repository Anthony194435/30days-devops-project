module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name                         = var.cluster_name
  cluster_version                      = var.cluster_version
  cluster_endpoint_public_access       = var.cluster_endpoint_public_access
  enable_cluster_creator_admin_permissions = var.enable_cluster_creator_admin_permissions
  bootstrap_self_managed_addons        = var.bootstrap_self_managed_addons

  vpc_id                   = var.vpc_id
  subnet_ids               = var.subnet_ids
  control_plane_subnet_ids = var.control_plane_subnet_ids

  cluster_addons = var.cluster_addons

  eks_managed_node_group_defaults = var.eks_managed_node_group_defaults
  eks_managed_node_groups         = var.eks_managed_node_groups

  cluster_compute_config = var.cluster_compute_config
  access_entries         = var.access_entries

  # 🔑 Custom IAM roles
  # cluster_role_arn       = var.cluster_role_arn
  # node_iam_role_arn      = var.node_role_arn

  tags = var.tags
}
