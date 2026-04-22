# compute/variables.tf

variable "vpc_id" {
    description = "EC2's position (vpc ID)"
    type        = string
}

variable "subnet_id" {
    description = "EC2's place Subnet ID"
    type        = string
}

variable "instance_type" {
    description = "EC2 instance type"
    type        = string
    default     = "t2.micro"
}

variable "environment" {
    description = "Environment Name"
    type        = string
    default     = "dev"
}