provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_vpc" "vpc_test" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "test"
  }
}

resource "aws_subnet" "public_sub_test" {
  vpc_id                  = aws_vpc.vpc_test.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-test"
  }
}

resource "aws_subnet" "private_sub_test" {
  vpc_id                  = aws_vpc.vpc_test.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = false

  tags = {
    Name = "private-test"
  }
}

resource "aws_internet_gateway" "igw_test" {
  vpc_id = aws_vpc.vpc_test.id

  tags = {
    Name = "igw-test"
  }
}

resource "aws_route_table" "public_rt_test" {
  vpc_id = aws_vpc.vpc_test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_test.id
  }

  tags = {
    Name = "public-rt-test"
  }
}

resource "aws_route_table_association" "public_sub_asso_test" {
  subnet_id      = aws_subnet.public_sub_test.id
  route_table_id = aws_route_table.public_rt_test.id
}

resource "aws_eip" "eip_test" {
  domain = "vpc"

  tags = {
    Name = "eip-test"
  }
}

resource "aws_nat_gateway" "ngw_test" {
  allocation_id = aws_eip.eip_test.id
  subnet_id     = aws_subnet.public_sub_test.id

  tags = {
    Name = "ngw-test"
  }

  depends_on = [aws_internet_gateway.igw_test]
}
