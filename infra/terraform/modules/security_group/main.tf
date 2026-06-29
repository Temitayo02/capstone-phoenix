resource "aws_security_group" "k3s" {
  name        = "${var.project_name}-${var.environment}-k3s-sg"
  description = "Security group for K3s cluster"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.project_name}-${var.environment}-k3s-sg"
  }
}

# Allow SSH only from your IP
resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.k3s.id

  cidr_ipv4   = var.allowed_ssh_cidr
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"

  description = "Allow SSH from my IP"
}

# Allow HTTP
resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.k3s.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"

  description = "Allow HTTP"
}

# Allow HTTPS
resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.k3s.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"

  description = "Allow HTTPS"
}

# Allow Kubernetes API only within the cluster
resource "aws_vpc_security_group_ingress_rule" "kubernetes_api" {
  security_group_id = aws_security_group.k3s.id

  referenced_security_group_id = aws_security_group.k3s.id

  from_port   = 6443
  to_port     = 6443
  ip_protocol = "tcp"

  description = "Allow Kubernetes API within the cluster"
}

# Allow all communication between cluster nodes
resource "aws_vpc_security_group_ingress_rule" "internal" {
  security_group_id = aws_security_group.k3s.id

  referenced_security_group_id = aws_security_group.k3s.id

  ip_protocol = "-1"

  description = "Allow internal cluster communication"
}

# Allow all outbound traffic
resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.k3s.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  description = "Allow all outbound traffic"
}