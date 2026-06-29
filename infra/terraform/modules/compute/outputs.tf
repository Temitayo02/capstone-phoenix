output "public_ips" {
  description = "Public IPs of all K3s nodes"

  value = {
    for name, instance in aws_instance.k3s_nodes :
    name => instance.public_ip
  }
}

output "private_ips" {
  description = "Private IPs of all K3s nodes"

  value = {
    for name, instance in aws_instance.k3s_nodes :
    name => instance.private_ip
  }
}

output "instance_ids" {
  description = "Instance IDs"

  value = {
    for name, instance in aws_instance.k3s_nodes :
    name => instance.id
  }
}