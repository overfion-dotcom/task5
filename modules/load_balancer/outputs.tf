# output "alb_id" {
#   value       = aws_lb.main.id
#   description = "The ID of the load balancer"
# }
#
# output "alb_arn" {
#   value       = aws_lb.main.arn
#   description = "The ARN of the load balancer"
# }
#
# output "alb_dns_name" {
#   value       = aws_lb.main.dns_name
#   description = "The DNS name of the load balancer"
# }
#
# output "alb_zone_id" {
#   value       = aws_lb.main.zone_id
#   description = "The zone ID of the load balancer"
# }

output "target_group_id" {
  value       = aws_lb_target_group.tg.id
  description = "The ID of the target group"
}

output "target_group_arn" {
  value       = aws_lb_target_group.tg.arn
  description = "The ARN of the target group"
}

output "target_group_name" {
  value       = aws_lb_target_group.tg.name
  description = "The name of the target group"
}

# output "listener_arn" {
#   value       = aws_lb_listener.http.arn
#   description = "The ARN of the listener"
# }
#
# output "listener_id" {
#   value       = aws_lb_listener.http.id
#   description = "The ID of the listener"
# }
