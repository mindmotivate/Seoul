## AWS Internet Gateway Terraform Module Overview

This Terraform configuration creates an AWS Internet Gateway resource named "app1_igw" associated with the VPC named "app1" in the Seoul region.

- The Internet Gateway is linked to the VPC using `vpc_id = aws_vpc.app1.id`.
- The resource is tagged with metadata, including the Internet Gateway name, associated service, owner, and the relevant planet.
