resource "aws_lb" "app1_alb" {
  name        = "app1-load-balancer"
  internal      = false
  load_balancer_type = "application"
  security_groups  = [aws_security_group.app1-sg02-LB01.id]
  subnets      = [
    aws_subnet.public-ap-northeast-2a.id,
    aws_subnet.public-ap-northeast-2b.id,
    aws_subnet.public-ap-northeast-2c.id,
    aws_subnet.public-ap-northeast-2d.id
  ]
  enable_deletion_protection = false

  tags = {
    Name  = "App1LoadBalancer"
    Service = "App1"
    Owner  = "User"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app1_alb.arn
  port       = 80
  protocol     = "HTTP"

  default_action {
    type       = "forward"
    target_group_arn = aws_lb_target_group.app1_tg.arn
  }
}

output "lb_dns_name" {
  value = aws_lb.app1_alb.dns_name
  description = "The DNS name of the App1 Load Balancer."
}


