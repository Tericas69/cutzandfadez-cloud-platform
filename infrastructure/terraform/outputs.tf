# outputs.tf
# Display key information after Terraform deployment

output "s3_bucket_name" {
  description = "The name of the S3 bucket for static site hosting"
  value       = aws_s3_bucket.static_site.bucket
}

output "region" {
  description = "The AWS region used for deployment"
  value       = var.aws_region
}
