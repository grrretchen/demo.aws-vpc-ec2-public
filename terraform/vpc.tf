# Creating VPC
resource "aws_vpc" "my-vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "Webserver-VPC"
    ResourceGroup = var.resource_group_name
  }
}