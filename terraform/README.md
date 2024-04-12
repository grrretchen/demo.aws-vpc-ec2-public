Create a VPC

Navigate to the VPC console. 

Create a VPC with the following values:
  - my-vpc
  - 10.0.0.0/16
  - No IPv6 CIDR block
  - Default tenancy
  - Note: Do not use the VPC Wizard to create your VPC; instead, configure your VPC from scratch.

Create a Public Subnet
  - Build a public subnet for your VPC.
  - Ensure you are assigning the valid CIDR blocks when creating your subnet.

Create Routes and Configure Internet Gateway
  - Automatically request a public IPv4 address for instances launched into the public subnet.
  - Enable auto-assign public IPv4 address.
  - Create internet gateway and attach to VPC.
  - Create a new route table to direct traffic in the public subnet.

Note: You may notice there is already a default route table created for you associated with your main network. This route allows traffic from the 10.0.0.0/16 network to pass to other nodes within the network, but it does not allow traffic to go outside of the network, such as to the public internet. Each VPC you create by default is associated with this main route table; therefore, the main route table shouldn't allow traffic out to the public internet, so we'll create a new one specifically for public internet traffic.

Launch EC2 Instance in Subnet
  - Launch an EC2 instance in your subnet.
  - Select Amazon Linux 2 AMI, 64-bit (x86), t2.micro.

Create a new key pair.