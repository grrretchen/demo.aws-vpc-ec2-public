resource "aws_instance" "spec_webserver" {

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.keypair.id
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.webserver.id]

  associate_public_ip_address = true

  tags = {
    Name    = "Webserver"
    Project = var.project_name
  }

  user_data_base64 = base64encode(data.local_file.userdata.content)
#   user_data                   = data.local_file.userdata.content
  user_data_replace_on_change = true
  #   EOF

  #   user_data = <<-EOF
  #       #!/bin/bash
  #       # Use this for your user data (script from top to bottom)
  #       # install httpd (Linux 2 version)
  #       yum update -y
  #       yum install -y httpd
  #       systemctl start httpd
  #       systemctl enable httpd
  #       echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  #     EOF
}

# EC2 User Data
data "local_file" "userdata" {
  filename = "${path.module}/userdata.txt"
}


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