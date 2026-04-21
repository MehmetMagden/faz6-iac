# outputs.tf

output "vpc_id" {
    value       = aws_vpc.swiss_vpc.id
    description = "SwissOps VPC ID"
}

output "server_id" {
    value       = aws_instance.app_server.id
    description = "SwissTask EC2 Instance ID"
}

output "server_private_ip" {
    value       = aws_instance.app_server.private_ip
    description = "SwissTask  server IP - Ansible"
}