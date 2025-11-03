output "ec2_profile" {
  value       = aws_iam_instance_profile.ec2_profile
  description = "iam profile for ec2 instances"
}
