module "vpc" {
  source = "git::https://github.com/Anthony194435/30days-devops-project.git//terraform-modules-infra/vpc?ref=develop"

  vpc_name            = var.vpc_name
  vpc_cidr            = var.vpc_cidr
  availability_zones  = var.availability_zones
  public_subnets      = var.public_subnets
  private_subnets     = var.private_subnets
  enable_nat_gateway  = var.enable_nat_gateway
  single_nat_gateway  = var.single_nat_gateway
  tags                = var.tags
}

module "iam" {
  source = "git::https://github.com/Anthony194435/30days-devops-project.git//terraform-modules-infra/iam?ref=develop"

  name = "eks-dev"
  tags = var.tags
}

module "eks" {
  source = "git::https://github.com/Anthony194435/30days-devops-project.git//terraform-modules-infra/eks?ref=develop"

  cluster_name                              = var.cluster_name
  cluster_version                           = var.cluster_version
  cluster_endpoint_public_access            = var.cluster_endpoint_public_access
  enable_cluster_creator_admin_permissions  = var.enable_cluster_creator_admin_permissions
  bootstrap_self_managed_addons             = var.bootstrap_self_managed_addons

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnet_ids
  control_plane_subnet_ids = module.vpc.private_subnet_ids

  cluster_addons                    = var.cluster_addons
  eks_managed_node_groups          = var.eks_managed_node_groups
  eks_managed_node_group_defaults  = var.eks_managed_node_group_defaults
  cluster_compute_config           = var.cluster_compute_config
  access_entries                   = var.access_entries

  cluster_role_arn  = module.iam.cluster_role_arn
  node_role_arn     = module.iam.node_role_arn

  tags = var.tags
}
