# outputs.tf
# compute module

output "vpc_id" {
    value       = aws_vpc.swiss_vpc.id
    description = "Created VPC's ID"    
}

output "subnet_id" {
    value       = aws_subnet.public_subnet.id
    description = "Created Subnet's ID"
}