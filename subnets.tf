resource "aws_subnet" "public_subnet_1" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.main_vpc.id
  map_public_ip_on_launch = true
  tags = {
    Name = "Pubilc Subnet 1"
  }
}

resource "aws_route_table_association" "public_subnet_1_rta" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id = aws_subnet.public_subnet_1.id
}

resource "aws_subnet" "public_subnet_2" {
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.main_vpc.id
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet 2"
  }
}

resource "aws_route_table_association" "public_subnet_2_rta" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id = aws_subnet.public_subnet_2.id
}


resource "aws_subnet" "private_subnet_1" {
  cidr_block = "10.0.3.0/24"
  vpc_id = aws_vpc.main_vpc.id
  availability_zone = "us-east-1e"
  tags = {
    Name = "Private Subnet 1"
  }
}

resource "aws_route_table_association" "private_subnet_1_rta" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id = aws_subnet.private_subnet_1.id
}

resource "aws_subnet" "private_subnet_2" {
  cidr_block = "10.0.4.0/24"
  vpc_id = aws_vpc.main_vpc.id
  availability_zone = "us-east-1f"
  tags = {
    Name = "Private Subnet 2"
  }
}

resource "aws_route_table_association" "private_subnet_2_rta" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id = aws_subnet.private_subnet_2.id
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  subnet_ids = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  tags = {
    Name = "Main RDS Subnet Group"
  }
}