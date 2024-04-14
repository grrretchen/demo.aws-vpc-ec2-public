# CIDR Block for VPC
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

# CIDR Block for Public Subnet
variable "subnet1_cidr_public" {
  type = string
  default = "10.0.0.0/24"
}