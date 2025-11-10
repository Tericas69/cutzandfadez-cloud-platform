# main.tf
# Core infrastructure for the Cutz & Fadez Cloud Platform

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# -------------------------------------------------------------------
# Networking
# -------------------------------------------------------------------
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "${var.project_name}-vpc"
  cidr = var.vpc_cidr

  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

# -------------------------------------------------------------------
# S3 for static site hosting
# -------------------------------------------------------------------
resource "aws_s3_bucket" "frontend_bucket" {
  bucket = "${var.project_name}-${var.environment}-frontend"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

# -------------------------------------------------------------------
# RDS for application data
# -------------------------------------------------------------------
resource "aws_db_instance" "app_db" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  name                 = "cutzfadezdb"
  username             = "admin"
  password             = "changeme123"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

