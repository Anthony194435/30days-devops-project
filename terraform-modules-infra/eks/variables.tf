variable "region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "demo-eks"
}

variable "cluster_version" {
  default = "1.29"
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "dev"
    Project     = "eks-bootstrap"
  }
}