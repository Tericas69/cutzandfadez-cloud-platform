# outputs.tf
# Display key resource details after apply

output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnets
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket hosting the frontend"
  value       = aws_s3_bucket.frontend_bucket.bucket
}

output "s3_bucket_website_endpoint" {
  description = "Website endpoint for the S3 bucket"
  value       = aws_s3_bucket.frontend_bucket.website_endpoint
}

output "rds_endpoint" {
  description = "RDS database endpoint"
  value       = aws_db_instance.app_db.endpoint
}

output "rds_db_name" {
  description = "RDS database name"
  value       = aws_db_instance.app_db.name
}
