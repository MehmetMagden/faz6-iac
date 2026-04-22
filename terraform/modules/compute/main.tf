# compute/main.tf

resource "aws_security_group" "app_sg" {
    name            = "swisstask-sg-${var.environment}"  # dev/prod
    description     = "SwissTask Apı Security Group"
    vpc_id          = var.vpc_id

    ingress {
        description = "SSH - for Ansible"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "SwissTask Flask API"
        from_port   = 5000
        to_port     = 5000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name        = "SwissTask-SG"
        Environment = var.environment
    }
}

resource "aws_instance" "app_server" {
    ami             = "ami-12345678"
    instance_type   = var.instance_type

    subnet_id               = var.subnet_id
    vpc_security_group_ids = [aws_security_group.app_sg.id]

    tags = {
        Name            = "SwissTask-Server"
        Environment = var.environment
    }
}