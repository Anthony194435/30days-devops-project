cluster_name = "eks-dev"
cluster_version = "1.31"
cluster_endpoint_public_access = false
enable_cluster_creator_admin_permissions = true
bootstrap_self_managed_addons = false

vpc_name = "eks-vpc"
vpc_cidr = "10.0.0.0/16"
availability_zones = ["us-east-1a", "us-east-1b"]
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
enable_nat_gateway = true
single_nat_gateway = true

eks_managed_node_group_defaults = {
  instance_types = ["m3.large"]
}

eks_managed_node_groups = {
  gp = {
    instance_types = ["m3.large"]
    min_size       = 2
    max_size       = 3
    desired_size   = 2
  }
}

cluster_addons = {
  coredns = {}
  kube-proxy = {}
  vpc-cni = {}
  eks-pod-identity-agent = {}
}

cluster_compute_config = null

access_entries = {}

tags = {
  Environment = "dev"
  Owner       = "Ikechukwu"
}
