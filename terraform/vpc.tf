# Creating VPC
resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "my-vpc"
    ResourceGroup = var.resource_group_name
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "${var.subnet1_cidr_public}"

  tags = {
    Name = "my-public-subnet"
  }
}