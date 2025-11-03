output "bastion_sg_id" {
  value       = aws_security_group.bastion_sg.id
  description = "Bastion security group ID"
}

output "ec2_sg_id" {
  value       = aws_security_group.ec2_sg.id
  description = "EC2 security group ID"
}

output "rds_sg_id" {
  value       = aws_security_group.rds_sg.id
  description = "RDS security group ID"
}

output "alb_sg_id" {
  value       = aws_security_group.alb_sg.id
  description = "ALB security group ID"
}
