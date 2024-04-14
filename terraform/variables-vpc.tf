# Defining CIDR Block for VPC
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

# Defining CIDR Block for 1st Subnet
variable "subnet1_cidr_public" {
  type = string
  default = "10.0.0.0/24"
}