# terraform/modules/network/variables.tf

variable "vpc_cidr" {
    description = "VPC CIDR block"
    type        = string
    default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
    description = "Public subnet CIDR Block"
    type        = string
    default     = "10.0.1.0/24"
}

variable "environment" {
    description = "Environment name (dev, prod)"
    type        = string
    default     = "dev"
}