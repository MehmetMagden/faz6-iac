resource "aws_vpc" "swiss_vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "SwissOps-VPC"
    }
}

# -- 2. subnet -- vpc İÇİNDEKİ BİR BÖLGE
resource "aws_subnet" "public_subnet" {
    vpc_id      = aws_vpc.swiss_vpc.id   # VPC'ye referans
    cidr_block = "10.0.1.0/24"

    tags = {
        Name = "SwissOps-Public-Subnet"
    }
}

# -- 3. INTERNET GATEWAY -- Dis dünyaya kapı
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.swiss_vpc.id

    tags = {
        Name = "SwissOps-IGW"
    }
}