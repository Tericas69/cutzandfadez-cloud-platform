# variables.tf
# Input variables for Terraform deployment

variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Prefix name for project resources"
  type        = string
  default     = "cutzandfadez"
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}
