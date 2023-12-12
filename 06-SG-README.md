## AWS Security Groups Terraform Module Overview

This Terraform configuration defines two security groups for the "app1" VPC in the Tokyo region, each serving different purposes.

*Security Group 1 (`aws_security_group.app1-sg01-servers`):*
- Named "app1-sg01-servers" with a description matching the name.
- Associated with the "app1" VPC.
- Ingress rules allow traffic on port 80 (HTTP), port 22 (SSH), and port 3389 (RDP) from any source (`0.0.0.0/0`).
- Egress rules allow all outbound traffic.
- Tagged with metadata including the name, service, owner, and the associated planet.

*Security Group 2 (`aws_security_group.app1-sg02-LB01`):*
- Named "app1-sg02-LB01" with a description matching the name.
- Associated with the "app1" VPC.
- Ingress rule allows traffic on port 80 (HTTP) from any source (`0.0.0.0/0`).
- Egress rules allow all outbound traffic.
- Tagged with metadata including the name, service, owner, and the associated planet.

These security groups define the network access control for instances within the specified VPC, allowing or denying traffic based on defined rules. The first security group is designed for servers, permitting HTTP, SSH, and RDP traffic, while the second security group is tailored for a load balancer, allowing only HTTP traffic.
