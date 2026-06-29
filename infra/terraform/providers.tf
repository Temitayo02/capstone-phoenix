provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
      Owner       = "Temitayo"
      CreatedBy   = "Terraform"
    }
  }

  retry_mode  = "standard"
  max_retries = 5
}