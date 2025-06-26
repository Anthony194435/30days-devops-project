module "vpc" {
  source = "git::https://github.com/Anthony194435/30days-devops-project.git//terraform-modules-infra/vpc?ref=develop"

  cidr_block           = var.vpc_cidr
  public_subnets       = var.public_subnets
  private_subnets      = var.private_subnets
  availability_zones   = var.availability_zones
  enable_nat_gateway   = true
  single_nat_gateway   = true

  tags = var.tags
}

# module "iam" {
#   source = "git::https://github.com/Anthony194435/30days-devops-project.git//terraform-modules-infra/iam?ref=develop"

#   name = "eks-dev"
#   tags = var.tags
# }

module "eks" {
  source = "git::https://github.com/Anthony194435/30days-devops-project.git//terraform-modules-infra/eks?ref=develop"

  cluster_name                         = var.cluster_name
  cluster_version                      = var.cluster_version
  subnet_ids                           = module.vpc.private_subnet_ids
  vpc_id                               = module.vpc.vpc_id
  control_plane_subnet_ids            = module.vpc.private_subnet_ids
  enable_cluster_creator_admin_permissions = true
  bootstrap_self_managed_addons       = true

  eks_managed_node_groups             = var.eks_managed_node_groups
  eks_managed_node_group_defaults     = var.eks_managed_node_group_defaults
  cluster_addons                      = var.cluster_addons

  tags = var.tags
}