## AWS Route Tables Terraform Module Overview

This Terraform configuration defines route tables for public and private subnets within the VPC named "app1" in the Tokyo region.

*Private Route Table (`aws_route_table.private`):*
- The route table is associated with the VPC and configured with a default route (`0.0.0.0/0`) pointing to the NAT Gateway named "app1_nat."
- This ensures that traffic from the private subnet is directed towards the NAT gateway
- Tagged with the name "private."

*Public Route Table (`aws_route_table.public`):*
- The route table is associated with the VPC and configured with a default route (`0.0.0.0/0`) pointing to the Internet Gateway named "app1_igw."
- This ensures that traffic from the public subnet is directed towards the IGW
- Tagged with the name "public."

*Associations:*
- Private route table associations with private subnets in availability zones 2a, 2b, 2c, 2d
- Public route table associations with public subnets in availability zones 2a, 2b, 2c, 2d
