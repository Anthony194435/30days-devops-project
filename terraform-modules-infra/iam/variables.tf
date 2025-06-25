variable "name" {
  type        = string
  description = "Prefix for naming IAM roles"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
