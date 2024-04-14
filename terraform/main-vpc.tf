# VPC
resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name          = "my-vpc"
    ResourceGroup = var.resource_group_name
  }
}


# VPC Subnet
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "${var.subnet1_cidr_public}"

  map_public_ip_on_launch = true

  tags = {
    Name = "my-public-subnet"
  }
}


# VPC Internet Gateway
resource "aws_internet_gateway" "main" {
  tags = {
    Name = "my-internet-gateway"
  }
}


# VPC Internet Gateway Attachment
resource "aws_internet_gateway_attachment" "main" {
  internet_gateway_id = aws_internet_gateway.main.id
  vpc_id              = aws_vpc.main.id
}


# VPC Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "public-routetable"
  }
}


# VPC Route Table Route
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}


# VPC Route Table Association
resource "aws_route_table_association" "public_sn" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}