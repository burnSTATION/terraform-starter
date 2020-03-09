resource "aws_internet_gateway" "main_vpc_igw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "Main Internet Gateway"
  }
}

resource "aws_eip" "nat_gateway_eip" {
  vpc = true
  public_ipv4_pool = "amazon"
}

resource "aws_nat_gateway" "main_vpc_ngw" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id = aws_subnet.public_subnet_1.id
  tags = {
    Name = "Private Subnet NAT Gateway"
  }
}