variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS CLI profile to use"
  type        = string
  default     = "lchahal"
}

variable "bucket_name" {
  description = "S3 bucket name for Terraform remote state"
  type        = string
  default     = "xxx-tfstate-01"
}