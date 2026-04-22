# terraform/modules/network/main.tf
# vpc.tf comes here

resource "aws_vpc" "swiss_vpc" {
    cidr_block = var.vpc_cidr

    tags = {
        Name        = "SwissOps-VPC"
        Environment = var.environment   # dev oder prod?
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id          = aws_vpc.swiss_vpc.id
    cidr_block      = var.subnet_cidr

    tags = {
        Name        = "SwissOps-Public-Subnet"
        Environment = var.environment
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.swiss_vpc.id

    tags = {
        Name        = "SwissOps-IGW"
        Environment = var.environment
    }
}