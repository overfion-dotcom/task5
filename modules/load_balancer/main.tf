# Application Load Balancer
# resource "aws_lb" "main" {
#   name               = "${var.project_name}-alb"
#   internal           = var.alb_internal
#   load_balancer_type = "application"
#   security_groups    = [var.security_group_id]
#   subnets            = var.public_subnet_ids
#
#   enable_deletion_protection = var.alb_enable_deletion_protection
#
#   tags = {
#     Name = "${var.project_name}-alb"
#   }
# }

# Target Group
resource "aws_lb_target_group" "tg" {
  name     = "${var.project_name}-tg"
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.vpc_id

  health_check {
    enabled             = var.health_check_enabled
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
    timeout             = var.health_check_timeout
    interval            = var.health_check_interval
    path                = var.health_check_path
    protocol            = var.target_group_protocol
    matcher             = var.health_check_matcher
  }

  deregistration_delay = var.deregistration_delay

  tags = {
    Name = "${var.project_name}-tg"
  }
}

# HTTP Listener
# resource "aws_lb_listener" "http" {
#   load_balancer_arn = aws_lb.main.arn
#   port              = var.listener_port
#   protocol          = var.listener_protocol
#
#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.tg.arn
#   }
# }
