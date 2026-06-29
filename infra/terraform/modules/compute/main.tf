locals {
  nodes = {
    control-plane = {
      subnet_index = 0
      role         = "control-plane"
    }

    worker-1 = {
      subnet_index = 0
      role         = "worker"
    }

    worker-2 = {
      subnet_index = 1
      role         = "worker"
    }
  }
}

resource "aws_instance" "k3s_nodes" {
  for_each = local.nodes

  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.public_subnet_ids[each.value.subnet_index]
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true

  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-${each.key}"
    Role        = each.value.role
    ManagedBy   = "Terraform"
    Environment = var.environment
  }
}