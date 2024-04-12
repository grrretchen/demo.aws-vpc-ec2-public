# Defining CIDR Block for VPC
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

# Defining CIDR Block for 1st Subnet
variable "subnet1_cidr_public" {
  default = "10.0.0.0/24"
}

# # Defining CIDR Block for 2nd Subnet
# variable "subnet1_cidr" {
#   default = "10.0.2.0/24"
# }
# # Defining CIDR Block for 3rd Subnet
# variable "subnet2_cidr" {
#   default = "10.0.3.0/24"
# }