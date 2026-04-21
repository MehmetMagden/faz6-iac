# compute.tf

# -- SECURITY GROUP --

resource "aws_security_group" "app_sg" {
    name            = "swisstask-sg"
    description     = "SwissTask API Security Group"
    vpc_id          = aws_vpc.swiss_vpc.id

    # incoming traffic
    ingress {
        description = "SSS Ansible"
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

    # outgoing traffic
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "SwissTask-SG"
    }
}

# -- EC2 INSTANCE --
resource "aws_instance" "app_server" {
    ami             = "ami-12345678"
    instance_type   = "t2.micro"

    subnet_id           = aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.app_sg.id]

    tags = {
        Name = "SwissTask-Server"
    }
}