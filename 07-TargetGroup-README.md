## AWS Target Group Terraform Module Overview

This Terraform configuration defines an AWS Target Group for a load balancer in the "app1" VPC in the Tokyo region.

**Target Group Basics:**
   - `resource "aws_lb_target_group" "app1_tg" {`: This line initiates the definition of an AWS Load Balancer Target Group named "app1-target-group."

**Attributes:**
   - `name = "app1-target-group"`: Specifies the name of the target group.
   - `port = 80`: Defines the port on which the target group receives traffic.
   - `protocol = "HTTP"`: Specifies the protocol used for communication, in this case, HTTP.
   - `vpc_id = aws_vpc.app1.id`: Associates the target group with the "app1" VPC.

**Target Type:**
   - `target_type = "instance"`: Indicates that the target group will be used to route traffic to instances (EC2 instances, in this case).

**Health Check Configuration:**
   - `health_check { ... }`: Configures health checks to determine the health of registered instances.
     - `enabled = true`: Enables health checks.
     - `interval = 30`: Sets the interval between health checks to 30 seconds.
     - `path = "/"`: Specifies the path of the health check, in this case, the root path.
     - `protocol = "HTTP"`: Specifies the protocol for the health check.
     - `healthy_threshold = 5`: Number of consecutive successful health checks to consider the instance healthy.
     - `unhealthy_threshold = 2`: Number of consecutive failed health checks to consider the instance unhealthy.
     - `timeout = 5`: Maximum time allowed for each health check.
     - `matcher = "200"`: The expected HTTP status code indicating a healthy instance.

**Tags:**
   - `tags { ... }`: Assigns metadata to the target group for organizational purposes.
     - `Name = "App1TargetGroup"`
     - `Service = "App1"`
     - `Owner = "User"`
     - `Project = "Web Service"`

This target group defines how incoming traffic is distributed among registered instances and ensuring the health of those instances through regular health checks. 
