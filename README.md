# demo.terraform-aws-vpc-ec2-public

---

This project demonstrates a Terraform project which deploys new EC2 and VPC resources into an AWS account.

### Goals:
- Demonstrate a one-touch infrastructure-as-code project for provisioning resources
- Demonstrate a file-naming structure for organizing resource definitions
- Demonstrate a tagging strategy

### Resources created:
- Networking to enable public hosting
  - VPC
  - Public Subnet
  - Internet Gateway
  - Route Table
- Compute instance with basic Nginx "Hello World" webserver.
  - EC2
    - with "userdata" startup script
  - Security Group with ingress rules

### Engineering Standards:
- Defined using Terraform 
- Follows Terraform Style Guide:
  - https://developer.hashicorp.com/terraform/language/style 

### Usage:
- Preconditions:
  - AWS account
  - AWS environment variables are set up in terminal
    - `AWS_ACCESS_KEY_ID`
    - `AWS_SECRET_ACCESS_KEY` 
    - `AWS_SESSION_TOKEN`
  - Terraform installed locally

### Execution:
  - `cd terraform`
  - `terraform plan`
  - `terraform apply`
  - `terraform destroy`