# Creating Security Group


# EC2 Key Pair
data "local_file" "sshkey" {
  filename = "${path.module}/id_ssh.pub"
}


resource "aws_key_pair" "keypair" {
  key_name_prefix = var.project_name
  public_key      = data.local_file.sshkey.content

}


# VPC Security Group
resource "aws_security_group" "webserver" {
  vpc_id = aws_vpc.main.id

  # Inbound Rules
  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS access from anywhere
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Rules
  # Internet access to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}