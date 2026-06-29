output "security_group_id" {
  description = "Security Group ID for the K3s cluster"
  value       = aws_security_group.k3s.id
}