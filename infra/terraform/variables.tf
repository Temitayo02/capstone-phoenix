variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}
variable "project_name" {
  description = "Project name used for naming and tagging resources"
  type        = string
  default     = "taskapp-capstone"
}
variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}
variable "instance_type" {
  description = "EC2 instance type for Kubernetes nodes"
  type        = string
  default     = "t3.small"
}
variable "key_name" {
  description = "Existing AWS EC2 Key Pair"
  type        = string
}
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks"
  type        = list(string)

  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}
variable "private_subnet_cidrs" {
  description = "Private subnet CIDR blocks"
  type        = list(string)

  default = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]
}
variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into the EC2 instances"
  type        = string
}

