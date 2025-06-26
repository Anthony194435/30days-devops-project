region = "us-east-1"
cluster_name = "eks-dev"
cluster_version = "1.29"

vpc_cidr = "10.0.0.0/16"
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

cluster_addons = {
  coredns = {
    most_recent = true
  }
  kube-proxy = {
    most_recent = true
  }
  vpc-cni = {
    most_recent = true
  }
}

eks_managed_node_groups = {
  default = {
    min_size     = 1
    max_size     = 3
    desired_size = 2
    instance_types = ["t3.medium"]
    capacity_type  = "ON_DEMAND"
  }
}

tags = {
  Environment = "dev"
  Project     = "eks-bootstrap"
}
