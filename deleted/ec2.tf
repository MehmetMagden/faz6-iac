# ec2.tf

resource "aws=aws_instance" "app_server" {
    ami             = "ami-12345678"    # LocalStack mock AMI
    instance_type   ="t2.micro"

    subnet_id               = aws_subnet.public__subnet.id
    vpc_security_group_ids  = [aws_security_group.app_sg.id]

    tags = {
        Name = "SwissTask-Server"
    }
}

# -- OUTPUT: Server Informations --

output "server_id" {
    value           = aws_instance.app_server.id
    description = "SwissTask server ID"
}