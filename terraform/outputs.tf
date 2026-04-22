# outputs.tf

output "vpc_id" {
    value       = module.network.vpc_id
    description = "SwissOps VPC ID"
}

output "server_id" {
    value       = module.compute.instance_id
    description = "SwissTask EC2 Instance ID"
}

output "server_private_ip" {
    value       = module.compute.private_ip
    description = "SwissTask  server IP - Ansible"
}