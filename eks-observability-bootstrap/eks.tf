module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.5"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"
  subnet_ids      = aws_subnet.public[*].id
  vpc_id          = aws_vpc.main.id

  cluster_endpoint_public_access = true

  eks_managed_node_groups = {
    default = {
      desired_size = 2
      max_size     = 3
      min_size     = 1

      instance_types = ["t3.medium"]
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
