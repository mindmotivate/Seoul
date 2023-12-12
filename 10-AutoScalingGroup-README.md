## **AWS Auto Scaling Configuration Overview**

This Terraform configuration sets up an Auto Scaling Group with associated policies and protections, ensuring efficient scaling and management of instances based on CPU utilization metrics. It also attaches the ASG to an ALB target group for effective load balancing.This configuration sets up an Auto Scaling Group with associated policies and protections, ensuring efficient scaling and management of instances based on CPU utilization metrics. It also attaches the ASG to an ALB target group for effective load balancing.
- **Name Prefix:** "app1-auto-scaling-group-"
- **Minimum Size:** 3 instances
- **Maximum Size:** 15 instances
- **Desired Capacity:** 6 instances
- **VPC Zones:** Private subnets in ap-northeast-1a, ap-northeast-1c, ap-northeast-1d
- **Health Check Type:** ELB (Elastic Load Balancer)
- **Health Check Grace Period:** 300 seconds
- **Force Delete:** Enabled
- **Target Group ARNs:** Linked to the specified ALB target group
- **Launch Template:** Uses the specified launch template (with the latest version)
- **Enabled Metrics:** GroupMinSize, GroupMaxSize, GroupDesiredCapacity, GroupInServiceInstances, GroupTotalInstances
- **Lifecycle Hooks:** 
  - Launching: Instance protection with a 60-second heartbeat timeout
  - Terminating: Scale-in protection with a 300-second heartbeat timeout
- **Tags:** 
  - Name: "app1-instance" (propagated at launch)
  - Environment: "Production" (propagated at launch)

#### **Auto Scaling Policy**
- **Name:** "app1-cpu-target"
- **Auto Scaling Group:** Linked to the specified ASG
- **Policy Type:** TargetTrackingScaling
- **Estimated Instance Warmup:** 120 seconds
- **Target Tracking Configuration:** 
  - **Predefined Metric Type:** ASGAverageCPUUtilization
  - **Target Value:** 75.0

#### **Auto Scaling Attachment**
- **Auto Scaling Group:** Linked to the specified ASG
- **ALB Target Group ARN:** Linked to the specified ALB target group

