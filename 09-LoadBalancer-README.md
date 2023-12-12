## AWS Application Load Balancer (ALB) and Listener Terraform Module Overview

This Terraform configuration defines an AWS Application Load Balancer (ALB) named "app1-load-balancer" and an associated listener for HTTP traffic.

- Load Balancer:
  - `resource "aws_lb" "app1_alb" {`: Initiates the definition of an AWS Application Load Balancer.
  - `name = "app1-load-balancer"`: Sets the name for the ALB.
  - `internal = false`: Specifies whether the ALB should be internal (not accessible from the internet).
  - `load_balancer_type = "application"`: Defines the load balancer type as application.
  - `security_groups = [aws_security_group.app1-sg02-LB01.id]`: Associates the ALB with a security group.
  - `subnets`: Specifies the subnets in which the ALB will be deployed.
  - `enable_deletion_protection = false`: Disables deletion protection for the ALB.
  - `tags`: Assigns metadata tags such as Name, Service, Owner, and Project.

- Listener:
  - `resource "aws_lb_listener" "http" {`: Initiates the definition of an ALB listener for HTTP traffic.
  - `load_balancer_arn = aws_lb.app1_alb.arn`: Associates the listener with the previously defined ALB.
  - `port = 80`: Sets the listener port to 80 for HTTP traffic.
  - `protocol = "HTTP"`: Specifies the listener protocol as HTTP.
  - `default_action`: Configures the default action for the listener, forwarding traffic to the associated target group.

This configuration creates an ALB with an HTTP listener, enabling the distribution of incoming HTTP traffic across registered instances in the associated target group.
The listner defines the protocol and port for incoming traffic and dictates how to handle requests. It plays a key role in routing requests to the appropriate target groups based on defined rules or default actions.
