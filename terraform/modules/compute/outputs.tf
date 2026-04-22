# compute/outputs.tf

output "instance_id" {
    value       = aws_instance.app_server.id
    description = "EC2 instance ID"
}

output "private_ip" {
    value       = aws_instance.app_server.private_ip
    description = "EC2 private IP for Ansible"
}