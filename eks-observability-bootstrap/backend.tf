terraform {  
  backend "s3" {  
    bucket       = "your-terraform-state-bucket"  
    key          = "path/to/your/statefile.tfstate"  
    region       = "us-east-1"  
    encrypt      = true  
    use_lockfile = true  #S3 native locking
  }  
}