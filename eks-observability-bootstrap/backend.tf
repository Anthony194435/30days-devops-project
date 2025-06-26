terraform {
  backend "s3" {
    bucket         = "ikechukwu-terraform-state-file"
    key            = "eks/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true
  }
}
