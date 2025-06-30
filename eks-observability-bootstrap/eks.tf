

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.5"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"
  subnet_ids      = aws_subnet.public[*].id
  vpc_id          = aws_vpc.main.id


  enable_irsa = true
<<<<<<< HEAD
  cluster_endpoint_public_access = true
=======

  tags = {
    cluster = "eks-observabililty"
  }

  vpc_id = module.vpc.vpc_id

  eks_managed_node_group_defaults = {
    ami_type               = "AL2_x86_64"
    instance_types         = ["t3.medium"]
    vpc_security_group_ids = [aws_security_group.worker-sg.id]
  }
>>>>>>> fccfe3969647d623e5c9803fd837b995746ceb5c

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