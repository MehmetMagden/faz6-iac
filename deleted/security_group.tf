# security_group.tf

resource "aws_security_group" "app_sg" {
    name        = "swisstask-sg"
    description = "SwissTask API Security Group"
    vpc_id      = aws_vpc.swiss_vpc.id

    # Incoming Traffic (ingress) 

    # SSH connection / for ansible
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Flask/SwissTask API Port
    ingress {
        from_port   = 5000
        to_port     = 5000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Outgoing traffic (egress)
    # let evertying go 
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"    # all protocols
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "SwissTask-SG"
    }
}