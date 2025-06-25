variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "availability_zones" {
  type        = list(string)
  description = "AZs to use"
}

variable "public_subnets" {
  type        = list(string)
  description = "Public subnet CIDRs"
}

variable "private_subnets" {
  type        = list(string)
  description = "Private subnet CIDRs"
}

variable "enable_nat_gateway" {
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  type        = bool
  default     = true
}

variable "tags" {
  type        = map(string)
  default     = {}
}
